class InterruptSuffix < ActiveRecord::Base
  belongs_to :spell, :class_name => "Spell", :foreign_key => "spell_id"
  
  validates_presence_of :spell
  
  def process( factory, line )
    spell_id     = line.shift.to_i
    spell_name   = line.shift
    spell_school = line.shift.to_i
    
    self.spell = factory.spell( spell_id, spell_name, spell_school )
  end
end
