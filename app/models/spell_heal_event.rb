class SpellHealEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :amount, :overheal, :absorbed, :critical?, :to => :suffix
  
  def initialize( params = {} )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = HealSuffix.new if not self.suffix
  end
end