class SwingMissedEvent < Event
  validates_presence_of :suffix
  
  delegate :miss_type, :amount, :to => :suffix
  
  def initialize( params = nil )
    super( params )
    
    self.suffix = MissSuffix.new if not self.suffix
  end
end