class SwingDamageEvent < Event
  validates_presence_of :suffix

  delegate :amount, :overkill, :school, :resisted, :blocked, :absorbed, :to => :suffix
  delegate :critical?, :glancing?, :crushing?, :to => :suffix
  
  def initialize( params = {} )
    super( params )
    
    self.suffix = DamageSuffix.new if not self.suffix
  end
end