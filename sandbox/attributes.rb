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



## by attributes count

counter = Hash.new(0)
recs.each do |rec|
  attributes = rec['attributes'].split( '/')
  counter[ attributes.size ] += 1
end

pp counter.size
#=> 8
pp counter
#=> {3=>4429, 1=>429, 4=>1320, 2=>3672, 5=>129, 0=>12, 6=>8, 7=>1}


counter = counter.sort { |l,r| l[0]<=>r[0] }

## pretty print
counter.each do |rec|
  name    = rec[0]
  count   = rec[1]
  percent =  Float(count*100)/Float(recs.size)

  puts '| %-12s | %4d  (%5.2f %%) |' % [name, count, percent]
end



puts "bye"

__END__

| 0            |   12  ( 0.12 %) |
| 1            |  429  ( 4.29 %) |
| 2            | 3672  (36.72 %) |
| 3            | 4429  (44.29 %) |
| 4            | 1320  (13.20 %) |
| 5            |  129  ( 1.29 %) |
| 6            |    8  ( 0.08 %) |
| 7            |    1  ( 0.01 %) |


Alien        |    9  ( 0.09 %)
Red          |   15  ( 0.15 %)
Aqua         |   17  ( 0.17 %)
Purple       |   19  ( 0.19 %)
Ape          |   24  ( 0.24 %)
Purple Female |   53  ( 0.53 %)
Bot          |   57  ( 0.57 %)
Red Female   |   58  ( 0.58 %)
Demon        |   59  ( 0.59 %)
Blue Female  |   59  ( 0.59 %)
Skeleton     |   69  ( 0.69 %)
Orc          |   69  ( 0.69 %)
Zombie       |   80  ( 0.80 %)
Blue         |  156  ( 1.56 %)
Gold         |  198  ( 1.98 %)
Female 4     |  418  ( 4.18 %)
Male 4       |  557  ( 5.57 %)
Green Female | 1033  (10.33 %)
Female 1     | 1089  (10.89 %)
Female 3     | 1130  (11.30 %)
Male 1       | 1410  (14.10 %)
Green        | 1710  (17.10 %)
Male 3       | 1711  (17.11 %)

