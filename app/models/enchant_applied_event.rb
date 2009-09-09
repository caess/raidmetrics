class EnchantAppliedEvent < Event
  validates_presence_of :suffix
  
  delegate :enchant, :item, :to => :suffix
  
  def initialize( params = {} )
    super( params )
    
    self.suffix = EnchantSuffix.new if not self.suffix
  end
end