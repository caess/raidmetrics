class EventFactory
  attr_accessor :raid
  
  delegate :enchant, :environmental_type, :fail_type, :item, :miss_type, :spell, :unit, :to => :@cache
  
  def initialize
    @raid = nil
    
    @cache = ModelCache.new
  end
  
  def reset_cache
    @cache.reset
  end
  
  def EventFactory.new_event( type )
    class_name = type.split( '_' ).map { |word| word.capitalize }.join + 'Event'
    
    class_name.constantize.new
  end

  def get_unit( line )
    guid  = line.shift.hex
    name  = line.shift
    flags = line.shift.hex

    [ guid, name, flags ]
  end
  
  def build( raw_line )
    line = raw_line.scan( /"[^"]+"|[^, ]+/ ).map { |part| part[ 0 ].chr == '"' ? part.slice( 1, part.length - 2 ) : part }
    
    time = Time.parse( line.shift + " " + line.shift )
    type = line.shift
    
    source_guid, source_name, source_flags = get_unit( line )
    
    destination_guid, destination_name, destination_flags = get_unit( line )
    
    event = EventFactory.new_event( type )
    
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
