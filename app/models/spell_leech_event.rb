class SpellLeechEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :amount, :power_type, :extra_amount, :to => :suffix
  
  def initialize( params = nil )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = DrainSuffix.new if not self.suffix
  end
end