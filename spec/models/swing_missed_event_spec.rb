require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SwingMissedEvent do
  before(:each) do
    @event = SwingMissedEvent.new
  end
  
  it "should not have a prefix" do
    @event.prefix.should be_nil
  end
  
  it "should have a MISS suffix" do
    @event.suffix.should == "MISS"
  end
end