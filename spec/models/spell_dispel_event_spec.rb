require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellDispelEvent do
  before( :each ) do
    @event = SpellDispelEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DISPEL suffix" do
    @event.suffix.should == "DISPEL"
  end
  
  it "should have an event type of 'SPELL_DISPEL'" do
    @event.event_type.should == 'SPELL_DISPEL'
  end
end