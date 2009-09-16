module MapColumns
  module ClassMethods
    def map_column( new_name, old_name )
      define_method "#{new_name}" do
        read_attribute( old_name )
      end
      
      define_method "#{new_name}=" do |value|
        write_attribute( old_name, value )
      end
    end
    
    def map_boolean_column( new_name, old_name )
      define_method "#{new_name}?" do
        read_attribute( old_name ) == 1
      end
      
      define_method "#{new_name}=" do |value|
        value = value ? 1 : 0
        
        write_attribute( old_name, value )
      end
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
end