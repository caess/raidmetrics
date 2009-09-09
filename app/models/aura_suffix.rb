class AuraSuffix < ActiveRecord::Base
  validates_numericality_of :buff
  
  def process( factory, line )
    self.buff = line.shift == "BUFF" ? 1 : 0
  end
end
