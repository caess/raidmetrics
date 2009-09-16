class EventFactory
  attr_accessor :raid
  
  def initialize
    @raid = nil
    
    reset_cache
  end
  
  def reset_cache
    @enchant_cache = Hash.new
    Enchant.find_each do |enchant|
      @enchant_cache[ enchant.name ] = enchant
    end
    
    @environment_cache = Hash.new
    EnvironmentalType.find_each do |environment|
      @environment_cache[ environment.name ] = environment
    end
    
    @fail_cache = Hash.new
    FailType.find_each do |fail|
      @fail_cache[ fail.name ] = name
    end
    
    @item_cache = Hash.new
    Item.find_each do |item|
      @item_cache[ item.item_id ] = item
    end
    
    @miss_cache = Hash.new
    MissType.find_each do |miss|
      @miss_cache[ miss.name ] = miss
    end
    
    @spell_cache = Hash.new
    Spell.find_each do |spell|
      @spell_cache[ spell.spell_id ] = spell
    end
    
    @unit_cache = Hash.new
    Unit.find_each do |unit|
      @unit_cache[ unit.guid ] = unit
    end
  end
  
  def new_event( type )
    class_name = type.split( '_' ).map { |word| word.capitalize }.join + 'Event'
    
    class_name.constantize.new
  end
  
  def enchant( name )
    return @enchant_cache[ name ] if @enchant_cache.has_key?( name )
    
    enchant = Enchant.create!( :name => name )    
    @enchant_cache[ name ] = enchant
    
    enchant
  end
  
  def environmental_type( name )
    return @environment_cache[ name ] if @environment_cache.has_key?( name )
    
    environmental_type = EnvironmentalType.create!( :name => name )
    @environment_cache[ name ] = environmental_type
    
    environmental_type
  end
  
  def fail_type( name )
    return @fail_cache[ name ] if @fail_cache.has_key?( name )

    fail_type = FailType.create!( :name => name )
    @fail_cache[ name ] = fail_type
    
    fail_type      
  end
  
  def item( id, name )
    return @item_cache[ id ] if @item_cache.has_key?( id )

    item = Item.create!( :item_id => id, :name => name )
    @item_cache[ id ] = item
    
    item
  end
  
  def miss_type( name )
    return @miss_cache[ name ] if @miss_cache.has_key?( name )

    miss_type = MissType.create!( :name => name )
    @miss_cache[ name ] = miss_type
    
    miss_type
  end
  
  def spell( id, name, school )
    return @spell_cache[ id ] if @spell_cache.has_key?( id )

    spell = Spell.create!( :name => name, :spell_id => id, :school => school )
    @spell_cache[ id ] = spell
    
    spell
  end
  
  def unit( guid, name )
    return nil if guid == 0
    return @unit_cache[ guid ] if @unit_cache.has_key?( guid )

    unit = Unit.create!( :name => name, :guid => guid )
    @unit_cache[ guid ] = unit
    
    unit
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
