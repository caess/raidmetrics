require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellPeriodicDrainEvent do
  before(:each) do
    @event = SpellPeriodicDrainEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DRAIN suffix" do
    @event.suffix.should == "DRAIN"
  end
  
  it "should have an event type of 'SPELL_PERIODIC_DRAIN'" do
    @event.event_type.should == 'SPELL_PERIODIC_DRAIN'
  end
end