require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnvironmentalDamageEvent do
  before(:each) do
    @event = EnvironmentalDamageEvent.new
  end
  
  it "should have an ENVIRONMENTAL prefix" do
    @event.prefix.should == "ENVIRONMENTAL"
  end
  
  it "should have a DAMAGE suffix" do
    @event.suffix.should == "DAMAGE"
  end
end