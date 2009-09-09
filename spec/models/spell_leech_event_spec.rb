require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellLeechEvent do
  before(:each) do
    @event = SpellLeechEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.should == SpellPrefix
  end
  
  it "should have :suffix be a DrainSuffix" do
    @event.suffix.class.should == DrainSuffix
  end
  
  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end
  
  it "should delegate :amount to :suffix" do
    @event.suffix.should_receive( :amount )
    
    @event.amount
  end
  
  it "should delegate :power_type to :suffix" do
    @event.suffix.should_receive( :power_type )
    
    @event.power_type
  end
  
  it "should delegate :extra_amount to :suffix" do
    @event.suffix.should_receive( :extra_amount )
    
    @event.extra_amount
  end
end