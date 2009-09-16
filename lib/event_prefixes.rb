module EventPrefixes
  module ClassMethods
    def use_enchant_prefix
      self.belongs_to :enchant, :class_name => "Enchant", :foreign_key => "prefix1"
      self.belongs_to :item, :class_name => "Item", :foreign_key => "suffix1"
      
      define_method "process_prefix" do |factory, line|
        enchant_name = line.shift

        self.enchant = factory.enchant( enchant_name )

        item_id   = line.shift.to_i
        item_name = line.shift

        self.item = factory.item( item_id, item_name )
      end
      
      define_method "prefix" do
        "ENCHANT"
      end
    end
    
    def use_environmental_prefix
      self.belongs_to :environmental_type, :class_name => "EnvironmentalType", :foreign_key => "prefix1"
      
      define_method "process_prefix" do |factory, line|
        environmental_name = line.shift
        
        self.environmental_type = factory.environmental_type( environmental_name )
      end
      
      define_method "prefix" do
        "ENVIRONMENTAL"
      end
    end

    def use_spell_prefix
      self.belongs_to :spell, :class_name => "Spell", :foreign_key => "prefix1"
      
      define_method "process_prefix" do |factory, line|
        spell_id     = line.shift.to_i
        spell_name   = line.shift
        spell_school = line.shift.hex

        self.spell = factory.spell( spell_id, spell_name, spell_school )
      end
      
      define_method "prefix" do
        "SPELL"
      end
    end    
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
end