require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DamageSplitEvent do
  before(:each) do
    @event = DamageSplitEvent.new
  end
    
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DAMAGE suffix" do
    @event.suffix.should == "DAMAGE"
  end
  
  
  it "should have an event type of 'DAMAGE_SPLIT'" do
    @event.event_type.should == 'DAMAGE_SPLIT'
  end
end