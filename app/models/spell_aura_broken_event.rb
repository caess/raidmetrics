class SpellAuraBrokenEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :buff?, :to => :suffix
  
  def initialize( params = {} )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = AuraSuffix.new if not self.suffix
  end
end