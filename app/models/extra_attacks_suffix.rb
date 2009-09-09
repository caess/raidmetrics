class ExtraAttacksSuffix < ActiveRecord::Base
  validates_numericality_of :amount
  
  def process( factory, line )
    self.amount = line.shift.to_i
  end
end
