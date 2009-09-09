require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SwingMissedEvent do
  before(:each) do
    @event = SwingMissedEvent.new
  end
  
  it "should not have a prefix" do
    @event.prefix.should be_nil
  end
  
  it "should have :suffix be a MissedSuffix" do
    @event.suffix.class.should == MissSuffix
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