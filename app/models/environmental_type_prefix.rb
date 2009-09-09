class EnvironmentalTypePrefix < ActiveRecord::Base
  belongs_to :environmental_type, :class_name => "EnvironmentalType", :foreign_key => "environmental_type_id"
  
  validates_presence_of :environmental_type
  
  def process( factory, line )
    name = line.shift
    
    self.environmental_type = factory.environmental_type( name )
  end
end
