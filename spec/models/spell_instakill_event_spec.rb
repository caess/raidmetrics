require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellInstakillEvent do
  before(:each) do
    @event = SpellInstakillEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should not have a suffix" do
    @event.suffix.should be_nil
  end
  
  it "should have an event type of 'SPELL_INSTAKILL'" do
    @event.event_type.should == 'SPELL_INSTAKILL'
  end
end