require 'pixelart'


##
# read in all meta data records of all 10 000 punks (24px)
meta = read_csv( './punks12px.csv' )
puts "#{meta.size} punk(s)"  #=> 10000 punk(s)



recs = []


uniques = {}

(0..9999).each do |i|
    num = '%04d' % i
    path = "./hashcheck/#{num}.json"
    data = read_json( path )
    print "."
    print  i   if i % 1000 == 0

    hash = data['ethscription']['sha']
    uniques[ hash ] ||= [] 
    uniques[ hash ] << i

    recs << [data['ethscription']['ethscription_number'].to_s, i.to_s]
end
print "\n"



buf =<<TXT
# Duplicates


TXT

count = Hash.new(0)

uniques.each do |hash, nums|
    if nums.size > 1
        puts "!! #{hash}"
        buf << "### hash #{hash}\n"

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


write_text( "./DUPLICATES.md", buf )


pp count

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
