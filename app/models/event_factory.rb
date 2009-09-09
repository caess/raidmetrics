class EventFactory
  attr_accessor :raid
  
  def initialize
    @raid = nil
  end
  
  def new_event( type )
    class_name = type.split( '_' ).map { |word| word.capitalize }.join + 'Event'
    
    class_name.constantize.new
  end
  
  def enchant( name )
    enchant = Enchant.find_by_name( name )
    
    if not enchant
      enchant = Enchant.create!( :name => name )
    end
    
    enchant
  end
  
  def environmental_type( name )
    environmental_type = EnvironmentalType.find_by_name( name )
    
    if not environmental_type
      environmental_type = EnvironmentalType.create!( :name => name )
    end
    
    environmental_type
  end
  
  def fail_type( name )
    fail_type = FailType.find_by_name( name )
    
    if not fail_type
      fail_type = FailType.create!( :name => name )
    end
    
    fail_type      
  end
  
  def item( id, name )
    item = Item.find_by_item_id( id )
    
    if not item
      item = Item.create!( :item_id => id, :name => name )
    end
    
    item
  end
  
  def miss_type( name )
    miss_type = MissType.find_by_name( name )
    
    if not miss_type
      miss_type = MissType.create!( :name => name )
    end
    
    miss_type
  end
  
  def spell( id, name, school )
    spell = Spell.find_by_spell_id( id )
    
    if not spell
      spell = Spell.create!( :name => name, :spell_id => id, :school => school )
    end
    
    spell
  end
  
  def unit( guid, name )
    return nil if guid == 0
    
    unit = Unit.find_by_guid( guid )
    
    if not unit
      unit = Unit.create!( :name => name, :guid => guid )
    end
    
    unit
  end
  
  def build( raw_line )
    line = raw_line.scan( /"[^"]*"|[^, ]+/ ).map { |part| part[ 0 ] == '"' ? part.slice( 1, part.length - 2 ) : part }
    
    time = Time.parse( line.shift + " " + line.shift )
    type = line.shift
    
    source_guid  = line.shift.hex
    source_name  = line.shift
    source_flags = line.shift.hex
    
    destination_guid  = line.shift.hex
    destination_name  = line.shift
    destination_flags = line.shift.hex
    
    event = new_event( type )
    
    event.raid = @raid
    event.offset = time - @raid.time
    event.source = unit( source_guid, source_name )
    event.destination = unit( destination_guid, destination_name )
    event.source_flags = source_flags
    event.destination_flags = destination_flags
    
    event.process( self, line )
    
    event
  end
end