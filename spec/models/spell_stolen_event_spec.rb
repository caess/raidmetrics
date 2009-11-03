require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellStolenEvent do
  before( :each ) do
    @event = SpellStolenEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DISPEL suffix" do
    @event.suffix.should == "DISPEL"
  end
  
  it "should have an event type of 'SPELL_STOLEN'" do
    @event.event_type.should == 'SPELL_STOLEN'
  end
end