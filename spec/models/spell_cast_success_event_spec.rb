require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellCastSuccessEvent do
  before(:each) do
    @event = SpellCastSuccessEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should not have a suffix" do
    @event.suffix.should be_nil
  end
  
  it "should have an event type of 'SPELL_CAST_SUCCESS'" do
    @event.event_type.should == 'SPELL_CAST_SUCCESS'
  end
end