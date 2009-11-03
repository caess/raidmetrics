require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellPeriodicHealEvent do
  before(:each) do
    @event = SpellPeriodicHealEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a HEAL suffix" do
    @event.suffix.should == "HEAL"
  end
  
  it "should have an event type of 'SPELL_PERIODIC_HEAL'" do
    @event.event_type.should == 'SPELL_PERIODIC_HEAL'
  end
end