require 'cocos'


##
# read in all meta data records of all 10 000 punks (24px)
recs = read_csv( './punks12px.csv' )
puts "#{recs.size} punk(s)"  #=> 10000 punk(s)


counter = Hash.new(0)      # a hash (table) - let's (auto-)default to 0 for values

recs.each do |rec|
  type = rec['type']

  counter[ type ] += 1
end

pp counter

counter = counter.sort { |l,r| l[1]<=>r[1] }
#=> [["Alien", 9], ["Ape", 24], ["Zombie", 88], ["Female", 3840], ["Male", 6039]]

counter.each do |name,count|
  percent =  Float(count*100)/Float(recs.size)

  puts '%-12s | %4d  (%5.2f %%)' % [name, count, percent]
end

puts "bye"

__END__


{"Green Female"=>1174,
 "Gold"=>238,
 "Female 3"=>1145,
 "Male 1"=>1411,
 "Green"=>1712,
 "Female 1"=>1101,
 "Male 4"=>557,
 "Bot"=>60,
 "Male 3"=>1712,
 "Skeleton"=>69,
 "Blue"=>156,
 "Zombie"=>80,
 "Female 4"=>420,
 "Demon"=>62,
 "Ape"=>24,
 "Orc"=>70,
 "Alien"=>9}

 Alien        |    9  ( 0.09 %)
 Ape          |   24  ( 0.24 %)
 Bot          |   60  ( 0.60 %)
 Demon        |   62  ( 0.62 %)
 Skeleton     |   69  ( 0.69 %)
 Orc          |   70  ( 0.70 %)
 Zombie       |   80  ( 0.80 %)
 Blue         |  156  ( 1.56 %)
 Gold         |  238  ( 2.38 %)
 Female 4     |  420  ( 4.20 %)
 Male 4       |  557  ( 5.57 %)
 Female 1     | 1101  (11.01 %)
 Female 3     | 1145  (11.45 %)
 Green Female | 1174  (11.74 %)
 Male 1       | 1411  (14.11 %)
 Male 3       | 1712  (17.12 %)
 Green        | 1712  (17.12 %)

