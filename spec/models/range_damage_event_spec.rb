require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RangeDamageEvent do
  before(:each) do
    @event = RangeDamageEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DAMAGE suffix" do
    @event.suffix.should == "DAMAGE"
  end
  
  it "should have an event type of 'RANGE_DAMAGE'" do
    @event.event_type.should == 'RANGE_DAMAGE'
  end
end