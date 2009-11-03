require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellPeriodicEnergizeEvent do
  before( :each ) do
    @event = SpellPeriodicEnergizeEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an ENERGIZE suffix" do
    @event.suffix.should == "ENERGIZE"
  end
  
  it "should have an event type of 'SPELL_PERIODIC_ENERGIZE'" do
    @event.event_type.should == 'SPELL_PERIODIC_ENERGIZE'
  end
end