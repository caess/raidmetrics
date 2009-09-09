class SpellInstakillEvent < Event
  validates_presence_of :prefix
  
  delegate :spell, :to => :prefix
  
  def initialize( params = nil )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
  end
end