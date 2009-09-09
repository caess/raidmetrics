class EnergizeSuffix < ActiveRecord::Base
  validates_numericality_of :amount
  validates_numericality_of :power_type
  
  def process( factory, line )
    self.amount     = line.shift.to_i
    self.power_type = line.shift.to_i
  end
end
