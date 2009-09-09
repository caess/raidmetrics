class AuraDoseSuffix < ActiveRecord::Base
  validates_numericality_of :buff
  validates_numericality_of :amount
  
  def process( factory, line )
    self.buff   = line.shift == "BUFF" ? 1 : 0
    self.amount = line.shift.to_i
  end
end
