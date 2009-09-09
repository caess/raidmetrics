class SpellDispelFailedEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :spell, :to => :suffix, :prefix => :extra
  
  def initialize( params = {} )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = InterruptSuffix.new if not self.suffix
  end
end