class MissSuffix < ActiveRecord::Base
  belongs_to :miss_type, :class_name => "MissType", :foreign_key => "miss_type_id"
  
  validates_presence_of :miss_type
  validates_numericality_of :amount
  
  def process( factory, line )
    miss_type_name = line.shift
    
    self.miss_type = factory.miss_type( miss_type_name )
    self.amount    = line.shift.to_i
  end
end
