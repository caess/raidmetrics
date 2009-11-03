require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RangeMissedEvent do
  before(:each) do
    @event = RangeMissedEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a MISS suffix" do
    @event.suffix.should == "MISS"
  end
  
  it "should have an event type of 'RANGE_MISSED'" do
    @event.event_type.should == 'RANGE_MISSED'
  end
end