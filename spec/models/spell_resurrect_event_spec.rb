require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellResurrectEvent do
  before(:each) do
    @event = SpellResurrectEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should not have a suffix" do
    @event.suffix.should be_nil
  end
  
  it "should have an event type of 'SPELL_RESURRECT'" do
    @event.event_type.should == 'SPELL_RESURRECT'
  end
end