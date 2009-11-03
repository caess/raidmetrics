require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnvironmentalDamageEvent do
  before(:each) do
    @event = EnvironmentalDamageEvent.new
  end
  
  it "should have an ENVIRONMENTAL prefix" do
    @event.prefix.should == "ENVIRONMENTAL"
  end
  
  it "should have a DAMAGE suffix" do
    @event.suffix.should == "DAMAGE"
  end
  
  it "should have an event type of 'ENVIRONMENTAL_DAMAGE'" do
    @event.event_type.should == 'ENVIRONMENTAL_DAMAGE'
  end
end