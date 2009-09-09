class SpellMissedEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :miss_type, :amount, :to => :suffix
  
  def initialize( params = nil )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = MissSuffix.new if not self.suffix
  end
end