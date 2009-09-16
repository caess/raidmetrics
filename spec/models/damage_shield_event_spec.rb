require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DamageShieldEvent do
  before(:each) do
    @event = DamageShieldEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DAMAGE suffix" do
    @event.suffix.should == "DAMAGE"
  end
end