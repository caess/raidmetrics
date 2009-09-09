require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DamageShieldMissedEvent do
  before(:each) do
    @event = DamageShieldMissedEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end
  
  it "should have :suffix be a DamageSuffix" do
    @event.suffix.class.to_s.should == "MissSuffix"
  end
  
  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end
  
  it "should delegate :miss_type to :suffix" do
    @event.suffix.should_receive( :miss_type )
    
    @event.miss_type
  end
  
  it "should delegate :amount to :suffix" do
    @event.suffix.should_receive( :amount )
    
    @event.amount
  end
end