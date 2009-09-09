require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellHealEvent do
  before(:each) do
    @event = SpellHealEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end

  it "should have :suffix be an HealSuffix" do
    @event.suffix.class.to_s.should == "HealSuffix"
  end
  
  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end
  
  it "should delegate :amount to :suffix" do
    @event.suffix.should_receive( :amount )
    
    @event.amount
  end
  
  it "should delegate :overheal to :suffix" do
    @event.suffix.should_receive( :overheal )
    
    @event.overheal
  end
  
  it "should delegate :absorbed to :suffix" do
    @event.suffix.should_receive( :absorbed )
    
    @event.absorbed
  end
  
  it "should delegate :critical? to :suffix" do
    @event.suffix.should_receive( :critical? )
    
    @event.critical?
  end
end