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
end