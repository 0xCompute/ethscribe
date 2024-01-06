require 'cocos'


##
# read in all meta data records of all 10 000 punks (24px)
recs = read_csv( './etc/punks24px.csv' )
puts "#{recs.size} punk(s)"  #=> 10000 punk(s)



meta = []


STATS = Hash.new(0)


def generate_punk( *values  )
   ## remove empty attibutes
  values = values.select { |value| !value.empty? }
 
  punk_type       = values[0]
  attribute_names = values[1..-1]
        
  # change mid
  #  male   to (ethscribe) green 
  #  female to (ethscribe) green female
  punk_type = case punk_type
              when 'Male 2'   then 'Green'
              when 'Female 2' then 'Green Female'
              else   punk_type
              end 

  # change smile  to gold
  # change frown  to demon or skeleton or bot or orc
  punk_type = 'Gold'  if attribute_names.include?( 'Smile' )
    
  specials = ['Demon', 'Skeleton', 'Bot', 'Orc']
  punk_type = specials[ rand( specials.size ) ]  if attribute_names.include?( 'Frown' )
    

  ### more fun
  ##   turn every 10th male1 into blue
  if punk_type == 'Male 1'
    STATS['Male 1'] += 1  
    punk_type ='Blue'  if STATS['Male 1'] % 10 == 0 
  end


  ## attributes - rm smile
  ## attributes - rm frown
  attribute_names = attribute_names.select do |attribute_name|
                              case attribute_name
                              when 'Smile' then false
                              when 'Frown' then false
                              else true
                              end
                         end
 

  attribute_names = attribute_names.map do |attribute_name|
                                        case attribute_name
                                        when 'Small Shades'    then 'Laser Eyes Gold'
                                        when 'Welding Goggles' then 'Laser Eyes Gold'
                                        else attribute_name
                                        end
                                     end


  [punk_type, *attribute_names]
end # method generate


##
# let's go - generate all 10 000 using the records

srand( 4242 )   ## make deterministic

recs.each_with_index do |rec,i|
  puts "==> punk #{i}:"
  pp rec

  values = rec.values
  attributes = generate_punk( *values )

  type            = attributes[0]
  more_attributes = attributes[1..-1]

  meta << [i.to_s, type, more_attributes.join( ' / ')]   
end


headers = ['id', 'type', 'attributes']
File.open( "./tmp/punks12px.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end


puts "bye"
