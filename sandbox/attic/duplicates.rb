require 'cocos'


##
# read in all meta data records of all duplicates
recs = read_csv( './duplicates/punks12px.duplicates.csv' )
puts "#{recs.size} punk(s)"  #=> 221 punk(s)


##
# move ethscribe image to duplicates/ethscribe

=begin
recs.each do |rec|
    id = rec['id'].to_i(10)

    num = '%04d' % id
    path = "./ethscribe/punk#{num}.png"

    if File.exist?( path )
      puts "==> #{id}..."
      outpath = "./duplicates/ethscribe/punk#{num}.png"

      FileUtils.mv( path, outpath )
    end

    ## check hashcheck too
    path = "./hashcheck/#{num}.json"

    if File.exist?( path )
        puts "==> #{id}..."
        outpath = "./duplicates/hashcheck/#{num}.json"
  
        FileUtils.mv( path, outpath )
    end
end
=end


##
# move patch/replacement images
recs.each do |rec|
  id = rec['id'].to_i(10)

  num = '%04d' % id
  path = "./patch/punk#{num}.png"

  puts "==> #{id}..."
  outpath = "./ethscribe/punk#{num}.png"

  FileUtils.cp( path, outpath )
end


puts "bye"
