class ModelCache
  def initialize
    reset
  end
  
  def reset
    reset_enchant_cache
    reset_environmental_type_cache
    reset_fail_type_cache
    reset_item_cache
    reset_miss_type_cache
    reset_spell_cache
    reset_unit_cache
  end
  
  def reset_enchant_cache
    @enchant_cache = Hash.new
    Enchant.find_each do |enchant|
      @enchant_cache[ enchant.name ] = enchant
    end
  end
  
  def reset_environmental_type_cache
    @environmental_type_cache = Hash.new
    EnvironmentalType.find_each do |environmental_type|
      @environmental_type_cache[ environmental_type.name ] = environmental_type
    end    
  end
  
  def reset_fail_type_cache
    @fail_type_cache = Hash.new
    FailType.find_each do |fail_type|
      @fail_type_cache[ fail_type.name ] = fail_type
    end
  end
  
  def reset_item_cache
    @item_cache = Hash.new
    Item.find_each do |item|
      @item_cache[ item.item_id ] = item
    end
  end
  
  def reset_miss_type_cache
    @miss_type_cache = Hash.new
    MissType.find_each do |miss_type|
      @miss_type_cache[ miss_type.name ] = miss_type
    end    
  end
  
  def reset_spell_cache
    @spell_cache = Hash.new
    Spell.find_each do |spell|
      @spell_cache[ spell.spell_id ] = spell
    end
  end
  
  def reset_unit_cache
    @unit_cache = Hash.new
    Unit.find_each do |unit|
      @unit_cache[ unit.guid ] = unit
    end
  end
  
  def create_and_cache_enchant( name )
    @enchant_cache[ name ] = Enchant.create!( :name => name )
  end
    
  def enchant( name )
    create_and_cache_enchant( name ) if not @enchant_cache.has_key?( name )
    
    @enchant_cache[ name ]
  end
  
  def create_and_cache_environmental_type( name )
    @environmental_type_cache[ name ] = EnvironmentalType.create!( :name => name )
  end
  
  def environmental_type( name )
    create_and_cache_environmental_type( name ) if not @environmental_type_cache.has_key?( name )
    
    @environmental_type_cache[ name ]
  end
  
  def create_and_cache_fail_type( name )
    @fail_type_cache[ name ] = FailType.create!( :name => name )
  end
  
  def fail_type( name )
    create_and_cache_fail_type( name ) if not @fail_type_cache.has_key?( name )
    
    @fail_type_cache[ name ]
  end
  
  def create_and_cache_item( id, name )
    @item_cache[ id ] = Item.create!( :item_id => id, :name => name )
  end
  
  def item( id, name )
    create_and_cache_item( id, name ) if not @item_cache.has_key?( id )
    
    @item_cache[ id ]
  end
  
  def create_and_cache_miss_type( name )
    @miss_type_cache[ name ] = MissType.create!( :name => name )
  end
  
  def miss_type( name )
    create_and_cache_miss_type( name ) if not @miss_type_cache.has_key?( name )
    
    @miss_type_cache[ name ]
  end
  
  def create_and_cache_spell( id, name, school )
    @spell_cache[ id ] = Spell.create!( :name => name, :spell_id => id, :school => school )
  end
  
  def spell( id, name, school )
    create_and_cache_spell( id, name, school ) if not @spell_cache.has_key?( id )
    
    @spell_cache[ id ]
  end
  
  def create_and_cache_unit( guid, name )
    @unit_cache[ guid ] = Unit.create!( :guid => guid, :name => name )
  end
  
  def unit( guid, name )
    return nil if guid == 0
    
    create_and_cache_unit( guid, name ) if not @unit_cache.has_key?( guid )
    
    @unit_cache[ guid ]
  end
end