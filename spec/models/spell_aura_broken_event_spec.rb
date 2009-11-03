require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraBrokenEvent do
  before( :each ) do
    @event = SpellAuraBrokenEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an AURA suffix" do
    @event.suffix.should == "AURA"
  end
  
  it "should have an event type of 'SPELL_AURA_BROKEN'" do
    @event.event_type.should == 'SPELL_AURA_BROKEN'
  end
end