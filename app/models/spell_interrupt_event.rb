class SpellInterruptEvent < Event
  validates_presence_of :prefiX
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :spell, :to => :suffix, :prefix => :extra
  
  def initialize( params = nil )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = InterruptSuffix.new if not self.suffix
  end
end