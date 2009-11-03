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

  def build( raw_line )
    line = raw_line.scan( /"[^"]+"|[^, ]+/ ).map { |part| part[ 0 ].chr == '"' ? part.slice( 1, part.length - 2 ) : part }
    
    type = line.third

    event = EventFactory.new_event( type )

    event.process( self, @raid, line )
    
    event
  end
end
