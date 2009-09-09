require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellMissedEvent do
  before(:each) do
    @event = SpellMissedEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.should == SpellPrefix
  end
  
  it "should have :prefix be a MissedSuffix" do
    @event.suffix.class.should == MissSuffix
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