require 'pixelart'

## update fam composite via /ethscribe images



punks = ImageComposite.new( 100, 100, height: 12, width: 12 )

(0..9999).each do |i|
    num = '%04d' % i
    punks << Image.read( "./ethscribe/punk#{num}.png" )
end

punks.save( "./punks12px.png" )



puts "bye"