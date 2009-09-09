class SpellStolenEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :spell, :to => :suffix, :prefix => :extra
  delegate :buff?, :to => :suffix
  
  def initialize( params = {} )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = DispelSuffix.new if not self.suffix
  end
end