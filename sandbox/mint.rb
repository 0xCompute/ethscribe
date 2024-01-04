require 'pixelart'



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


puts "  #{duplicate_count} duplicate(s)"
pp duplicates

puts "bye"


