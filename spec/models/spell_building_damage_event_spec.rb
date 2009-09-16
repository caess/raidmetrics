require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellBuildingDamageEvent do
  before(:each) do
    @event = SpellBuildingDamageEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an AURA suffix" do
    @event.suffix.should == "DAMAGE"
  end
end