class HealSuffix < ActiveRecord::Base
  validates_numericality_of :amount
  validates_numericality_of :overheal
  validates_numericality_of :absorbed
  validates_numericality_of :critical
  
  def process( factory, line )
    self.amount   = line.shift.to_i
    self.overheal = line.shift.to_i
    
    if line.length == 1
      self.absorbed = 0
    else
      self.absorbed = line.shift.to_i
    end
    
    self.critical = line.shift.to_i
  end
end
