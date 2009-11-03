require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraBrokenSpellEvent do
  before( :each ) do
    @event = SpellAuraBrokenSpellEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DISPEL suffix" do
    @event.suffix.should == "DISPEL"
  end
  
  
  it "should have an event type of 'SPELL_AURA_BROKEN_SPELL'" do
    @event.event_type.should == 'SPELL_AURA_BROKEN_SPELL'
  end
end