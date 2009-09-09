class DamageSuffix < ActiveRecord::Base
  validates_numericality_of :amount
  validates_numericality_of :overkill
  validates_numericality_of :school
  validates_numericality_of :resisted
  validates_numericality_of :blocked
  validates_numericality_of :absorbed
  validates_numericality_of :critical
  validates_numericality_of :glancing
  validates_numericality_of :crushing
  
  def process( factory, line )
    self[ :amount ]   = line.shift.to_i
    self[ :overkill ] = line.shift.to_i
    self[ :school ]   = line.shift.to_i
    self[ :resisted ] = line.shift.to_i
    self[ :blocked ]  = line.shift.to_i
    self[ :absorbed ] = line.shift.to_i
    self[ :critical ] = line.shift.to_i
    self[ :glancing ] = line.shift.to_i
    self[ :crushing ] = line.shift.to_i
  end
end
