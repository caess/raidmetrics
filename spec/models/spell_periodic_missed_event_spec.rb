require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellPeriodicMissedEvent do
  before(:each) do
    @event = SpellPeriodicMissedEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a MISS suffix" do
    @event.suffix.should == "MISS"
  end
  
  it "should have an event type of 'SPELL_PERIODIC_MISSED'" do
    @event.event_type.should == 'SPELL_PERIODIC_MISSED'
  end
end