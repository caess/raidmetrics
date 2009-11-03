require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SwingDamageEvent do
  before(:each) do
    @event = SwingDamageEvent.new
  end
  
  it "should not have a prefix" do
    @event.prefix.should be_nil
  end
  
  it "should have a DAMAGE suffix" do
    @event.suffix.should == "DAMAGE"
  end
  
  it "should have an event type of 'SWING_DAMAGE'" do
    @event.event_type.should == 'SWING_DAMAGE'
  end
end