require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellCastFailedEvent do
  before(:each) do
    @event = SpellCastFailedEvent.new
  end  
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a FAIL suffix" do
    @event.suffix.should == "FAIL"
  end
  
  it "should have an event type of 'SPELL_CAST_FAILED'" do
    @event.event_type.should == 'SPELL_CAST_FAILED'
  end
end