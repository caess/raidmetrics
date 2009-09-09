class EnchantSuffix < ActiveRecord::Base
  belongs_to :enchant, :class_name => "Enchant", :foreign_key => "enchant_id"
  belongs_to :item, :class_name => "Item", :foreign_key => "item_id"
  
  validates_presence_of :enchant
  validates_presence_of :item
  
  def process( factory, line )
    enchant_name = line.shift
    self.enchant = factory.enchant( enchant_name )
    
    item_id   = line.shift.to_i
    item_name = line.shift
    self.item = factory.item( item_id, item_name )
  end
end
