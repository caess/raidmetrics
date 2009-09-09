class DispelSuffix < ActiveRecord::Base
  belongs_to :spell, :class_name => "Spell", :foreign_key => "spell_id"
  
  validates_presence_of :spell
  validates_numericality_of :buff
  
  def process( factory, line )
    spell_id     = line.shift.to_i
    spell_name   = line.shift
    spell_school = line.shift.to_i # All examples I've seen use an int rather than a hex here.
    
    self.spell = factory.spell( spell_id, spell_name, spell_school )
    
    self.buff = line.shift == "BUFF" ? 1 : 0
  end
end
