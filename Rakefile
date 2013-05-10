
require 'hoe'
require './lib/beerdb/labels/version.rb'


Hoe.spec 'beerdb-labels' do
  
  self.version = BeerDb::Labels::VERSION
  
  self.summary = 'beerdb-labels gem - beer labels (24x24, 32x32, 48x48, 64x64) bundled for reuse w/ asset pipeline'
  self.description = summary

  self.urls    = ['https://github.com/geraldb/beer.db.labels']
  
  self.author  = 'Gerald Bauer'
  self.email   = 'beerdb@googlegroups.com'
    
  self.readme_file  = 'README.md'
  self.history_file = 'History.md'
  
end


################################
#


# ls *.jpg | xargs -r -I FILE convert FILE -thumbnail 64x64 FILE_thumb.png

desc 'build thumbs'
task :build  do
  
  files = Dir['originals/*.jpg']
  
  files.each do |filename|
    basename = File.basename( filename, '.jpg' )

    puts "filename: #{filename}, basename: #{basename}"
    
    cmd64 = "convert #{filename} -thumbnail 64x64 vendor/assets/images/labels/64x64/#{basename}.png"
    cmd48 = "convert #{filename} -thumbnail 48x48 vendor/assets/images/labels/48x48/#{basename}.png"
    cmd32 = "convert #{filename} -thumbnail 32x32 vendor/assets/images/labels/32x32/#{basename}.png"
    cmd24 = "convert #{filename} -thumbnail 24x24 vendor/assets/images/labels/24x24/#{basename}.png"
    puts cmd64
    
    system( cmd64 )
    system( cmd48 )
    system( cmd32 )
    system( cmd24 )
  end
  
  ## todo: generate lookup list of all available labels (lets us check if label exists)
  
  ## todo: generate manifest.txt too
  
  puts 'Done.'
end
