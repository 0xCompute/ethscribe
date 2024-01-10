##
## for a sample
## see https://api.ethscriptions.com/api/collections/sample


require 'cocos'


meta = read_csv( './punks12px.csv' )
puts "  #{meta.size} meta record(s)"


collection_items = []

(0..9999).each do |i|
    num = '%04d' % i
    path = "./hashcheck/#{num}.json"

    print "."
    print i    if i % 100 == 0

    if File.exist?( path )
       data = read_json( path )

       spec = meta[ i ]
       type       = spec['type']
       attributes = (spec['attributes'] || '').split( '/' ).map {|attr| attr.strip }
    
       item_attributes = []
       item_attributes << { 'trait_type' => 'type',
                            'value'      => type }
       attributes.each do |attr|   ## change name to attribute (from accessory)
           item_attributes << { 'trait_type' => 'attribute',
                                'value'      => attr } 
       end

       item_attributes <<  { 'trait_type' => 'attribute count',
                             'value' => attributes.size.to_s }  ## number (type) possible?
   

      # for debate - what name to use?
      #   plain ->   Punk #0
      #  or          Punk 12px #0   or 
      #              Punk #0 (Punks 12px, Vol. 1 - Cassics)

       collection_items << {
                  'ethscription_id' => data['ethscription']['transaction_hash'],
                  'name' => "Punk 12px \##{i}",
                  'description' => '',
                  'external_url' => '',
                  'background_color' => '',
                  'item_index' => i,
                  'item_attributes' => item_attributes
               }
    end
end
print "\n"


##
# sample banner is 1400x350px
#  ethscribe color is #C3FF00
collection = {
  'name': 'punks12px',
  'description': 'punks 12px vol. 1 - classics - first-is-first',
  'total_supply': '10000',
  'logo_image_uri': 'esc://ethscriptions/0x1c1586e3c1993dad2796221ca13a24a580f0c91f68cadafdde4edf239e522fbd/data',
  'banner_image_uri': 'https://github.com/0xCompute/punks12px/raw/master/i/punks12px-banner.png',
  'background_color': '',
  'twitter_link': '',
  'website_link': 'https://github.com/0xCompute/punks12px',
  'discord_link': 'https://discord.gg/3JRnDUap6y',
  'collection_items' => collection_items
}

write_json( "./punks12px.json", collection )

puts "bye"
