require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellPeriodicDamageEvent do
  before(:each) do
    @event = SpellPeriodicDamageEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DAMAGE suffix" do
    @event.suffix.should == "DAMAGE"
  end
  
  it "should have an event type of 'SPELL_PERIODIC_DAMAGE'" do
    @event.event_type.should == 'SPELL_PERIODIC_DAMAGE'
  end
end