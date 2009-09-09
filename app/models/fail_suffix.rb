class FailSuffix < ActiveRecord::Base
  belongs_to :fail_type, :class_name => "FailType", :foreign_key => "fail_type_id"
  
  validates_presence_of :fail_type
  
  def process( factory, line )
    name = line.shift
    
    self.fail_type = factory.fail_type( name )
  end
end
