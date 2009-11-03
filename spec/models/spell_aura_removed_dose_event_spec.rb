require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraRemovedDoseEvent do
  before( :each ) do
    @event = SpellAuraRemovedDoseEvent.new
  end  
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an AURA_DOSE suffix" do
    @event.suffix.should == "AURA_DOSE"
  end
  
  it "should have an event type of 'SPELL_AURA_REMOVED_DOSE'" do
    @event.event_type.should == 'SPELL_AURA_REMOVED_DOSE'
  end
end