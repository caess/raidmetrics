require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraRemovedEvent do
  before( :each ) do
    @event = SpellAuraRemovedEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an AURA suffix" do
    @event.suffix.should == "AURA"
  end
  
  it "should have an event type of 'SPELL_AURA_REMOVED'" do
    @event.event_type.should == 'SPELL_AURA_REMOVED'
  end
end