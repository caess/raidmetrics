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
  
  def new_event( type )
    class_name = type.split( '_' ).map { |word| word.capitalize }.join + 'Event'
    
    class_name.constantize.new
  end
  
  def build( raw_line )
    line = raw_line.scan( /"[^"]+"|[^, ]+/ ).map { |part| part[ 0 ].chr == '"' ? part.slice( 1, part.length - 2 ) : part }
    
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
