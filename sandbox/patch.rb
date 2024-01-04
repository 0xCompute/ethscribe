##
# patch punks24px.csv

require 'cocos'


recs   = read_csv( "./tmp/punks12px.csv" )
patch  = read_csv( "./etc/duplicates/punks12px.patch.csv" )

patch.each do |rec|
    id = rec['id'].to_i(10)
    recs[id] = rec
end


headers = ['id', 'type', 'attributes']
File.open( "./punks12px.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   recs.each do |rec|
     f.write( rec.values.join( ', ' ))
     f.write( "\n" )
   end
end



puts "bye"