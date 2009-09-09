class DamageShieldEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix

  delegate :spell, :to => :prefix
  delegate :amount, :overkill, :school, :resisted, :blocked, :absorbed, :to => :suffix
  delegate :critical?, :glancing?, :crushing?, :to => :suffix
  
  
  def initialize( params = {} )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = DamageSuffix.new if not self.suffix
  end
end