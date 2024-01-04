require 'pixelart'


##
# read in all meta data records of all 10 000 punks (24px)
meta = read_csv( './punks12px.csv' )
puts "#{meta.size} punk(s)"  #=> 10000 punk(s)



recs = []


uniques = {}
duplicate_count = 0
duplicates = []

(0..9999).each do |i|
    num = '%04d' % i
    path = "./hashcheck/#{num}.json"
    data = read_json( path )
    print "."
    print  i   if i % 1000 == 0

    hash = data['ethscription']['sha']
 
    uniques[ hash ] ||= [] 
    uniques[ hash ] << i

    if uniques[ hash ].size == 1
       recs << [data['ethscription']['ethscription_number'].to_s, i.to_s]
    else
       puts "!! skipping duplicate"
       duplicate_count += 1

       duplicates << meta[i].values
    end
end
print "\n"


## sort buy inscribe num
recs = recs.sort {|l,r|  l[0].to_i(10) <=> r[0].to_i(10) }

headers = ['num', 'ref']
File.open( "./mint.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   recs.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end


## write out duplicates to replace

headers = ['id', 'type', 'attributes']
File.open( "./tmp/punks12px.duplicates.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   duplicates.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end



__END__

## patch
patch  = []

srand( 4242 )   ## make deterministic

def reshuffle( values )
    patch_males   = ['Red', 'Purple', 'Aqua']
    patch_females = ['Blue Female', 'Red Female', 'Purple Female']
    
    patch_females_hair = ['Blonde Side', 'White Side', 
                          'Pink Short', 
                          'Messy Hair Green',
                          'Messy Hair Blonde',
                          'Pigtails Red',
                          'Pigtails Blonde',
                          'Half Shaved Purple',
                          'Half Shaved Blonde',
                        ]

    patch_males_hair = ['Red Mohawk', 
                        'Peak Spike', 
                        'Mohawk Thin',
                        'Messy Hair',
                        'Purple Hair',
                        'Shaved Head']

    patch_males_head = ['Knitted Cap', 
                        'Cap']

    female = values[1].downcase.index('female') 

    type = female ? patch_females[ rand( patch_females.size )] :
                    patch_males[ rand( patch_males.size) ] 

    attributes =  values[2]
    if female
      hair = patch_females_hair[ rand( patch_females_hair.size ) ]
      attributes = attributes.sub( 'Tassle Hat', hair ) if attributes.index( 'Tassle Hat' )
      attributes = attributes.sub( 'Pilot Helmet', hair ) if attributes.index( 'Pilot Helmet' )             
    else
      hair = patch_males_hair[ rand( patch_males_hair.size ) ]
      attributes = attributes.sub( 'Mohawk Thin', hair )  if attributes.index( 'Mohawk Thin' )
      attributes = attributes.sub( 'Peak Spike', hair )  if attributes.index( 'Peak Spike' )
      attributes = attributes.sub( 'Shaved Head', hair )  if attributes.index( 'Shaved Head' )

      head = patch_males_head[ rand( patch_males_head.size) ]
      attributes = attributes.sub( 'Knitted Cap', head )  if attributes.index( 'Knitted Cap' )
    end

    [values[0], type, attributes]
end

## track uniques reshuffled too!!
reshuffled = {}

uniques.each do |hash, nums|
    if nums.size > 1
        puts "!! #{hash}"
        pp nums
        ## skip first num
        nums[1..-1].each_with_index do |num,i|
            values = nil
            loop do 
                values = reshuffle( meta[num].values )
              
              key = (values[1]+values[2]).downcase.gsub( /[^a-z0-9-]+/, '' )
              key = key.sub( 'earring', '' )
              key = key.sub( 'purplelipstick', '' )

              reshuffled[ key ] ||= []
              reshuffled[ key ] << num
              if reshuffled[ key ].size == 1
                 break
              else
                 puts "!! duplicates; reshuffle:"
                 pp reshuffled[ key ]
                 pp values
              end
            end
              
            patch << [num.to_s, values[1], values[2]]       
        end
    end
end


## sort by id
patch = patch.sort { |l,r| l[0].to_i(10) <=> r[0].to_i(10) }

headers = ['id', 'type', 'attributes']
File.open( "./patch.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   patch.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end






buf = ''

count = Hash.new(0)

uniques.each do |hash, nums|
    if nums.size > 1
        puts "!! #{hash}"
        buf << "### (#{nums.size}) hash #{hash}\n"

        pp nums
        nums.each do |num|
            values = meta[num].values 
            print "  #{num} => "
            print values.pretty_inspect
            print "\n"

            buf << "- #{num} => "  
            buf << "#{values[1]}"
            buf << ", #{values[2]}"  if !values[2].empty?
            buf << "\n"
        end
        buf << "\n"

       count[ nums.size] += 1
    end
end


header =<<TXT
# Duplicates

- #{count[2]} Duplicates (2x)
- #{count[3]} (x2 #{count[3]*2})  Triplicates (3x)
- #{count[4]} (x3 #{count[4]*3}) Quadruplicates (4x)


= #{count[2]+count[3]*2+count[4]*3} (#{count[2]} + #{count[3]}x2 + #{count[4]}x3)


TXT

write_text( "./DUPLICATES.md", header + buf )


puts header

pp count

puts "  duplicate count (double check): #{duplicate_count}"

puts "bye"



__END__

{2=>180, 4=>5, 3=>13}

- 180 Duplicates (2x)
- 13 (x2 26)  Triplicates (3x)
- 5  (x3 15) Quadruplicates (4x)


= 277 (180 + 26x2 + 15x3)


!! c1aed4f418407e8d3354434efa049c72968ab87107bec0df18e3ce4a5825bf43
[383, 4286]
  383 => ["383", "Green Female", "Straight Hair Blonde / Green Eye Shadow"]

  4286 => ["4286",
 "Green Female",
 "Hot Lipstick / Earring / Straight Hair Blonde / Green Eye Shadow"]
