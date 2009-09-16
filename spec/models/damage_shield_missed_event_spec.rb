require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DamageShieldMissedEvent do
  before(:each) do
    @event = DamageShieldMissedEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a MISS suffix" do
    @event.suffix.should == "MISS"
  end
end