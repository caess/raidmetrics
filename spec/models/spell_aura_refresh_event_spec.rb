require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraRefreshEvent do
  before( :each ) do
    @event = SpellAuraRefreshEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an AURA suffix" do
    @event.suffix.should == "AURA"
  end
  
  it "should have an event type of 'SPELL_AURA_REFRESH'" do
    @event.event_type.should == 'SPELL_AURA_REFRESH'
  end
end