module ArrayCardinals
  module InstanceMethods
    def sixth
      self[ 5 ]
    end

    def seventh
      self[ 6 ]
    end

    def eighth
      self[ 7 ]
    end

    def ninth
      self[ 8 ]
    end

    def first=( value )
      self[ 0 ] = value
    end

    def second=( value )
      self[ 1 ] = value
    end

    def third=( value )
      self[ 2 ] = value
    end

    def fourth=( value )
      self[ 3 ] = value
    end

    def fifth=( value )
      self[ 4 ] = value
    end

    def sixth=( value )
      self[ 5 ] = value
    end

    def seventh=( value )
      self[ 6 ] = value
    end

    def eighth=( value )
      self[ 7 ] = value
    end

    def ninth=( value )
      self[ 8 ] = value
    end
  end
  
  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end

Array.class_eval do
  include ArrayCardinals
end