class SpellExtraAttacksEvent < Event
  validates_presence_of :prefix
  validates_presence_of :suffix
  
  delegate :spell, :to => :prefix
  delegate :amount, :to => :suffix
  
  def initialize( params = {} )
    super( params )
    
    self.prefix = SpellPrefix.new if not self.prefix
    self.suffix = ExtraAttacksSuffix.new if not self.suffix
  end
end