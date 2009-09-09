class DrainSuffix < ActiveRecord::Base
  validates_numericality_of :amount
  validates_numericality_of :power_type
  validates_numericality_of :extra_amount
  
  def process( factory, line )
    self.amount       = line.shift.to_i
    self.power_type   = line.shift.to_i
    self.extra_amount = line.shift.to_i
  end
end
