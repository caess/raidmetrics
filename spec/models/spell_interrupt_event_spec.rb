require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellInterruptEvent do
  before(:each) do
    @event = SpellInterruptEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an INTERRUPT suffix" do
    @event.suffix.should == "INTERRUPT"
  end
  
  it "should have an event type of 'SPELL_INTERRUPT'" do
    @event.event_type.should == 'SPELL_INTERRUPT'
  end
end