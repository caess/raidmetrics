require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellDispelFailedEvent do
  before( :each ) do
    @event = SpellDispelFailedEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an INTERRUPT suffix" do
    @event.suffix.should == "INTERRUPT"
  end
  
  it "should have an event type of 'SPELL_DISPEL_FAILED'" do
    @event.event_type.should == 'SPELL_DISPEL_FAILED'
  end
end