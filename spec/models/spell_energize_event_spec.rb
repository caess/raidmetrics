require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellEnergizeEvent do
  before( :each ) do
    @event = SpellEnergizeEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end
  
  it "should have :suffix be an EnergizeSuffix" do
    @event.suffix.class.to_s.should == "EnergizeSuffix"
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
end