require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellLeechEvent do
  before(:each) do
    @event = SpellLeechEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DRAIN suffix" do
    @event.suffix.should == "DRAIN"
  end
end