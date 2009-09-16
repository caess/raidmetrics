require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UnitDiedEvent do
  before(:each) do
    @event = UnitDiedEvent.new
  end
  
  it "should have not have a prefix" do
    @event.prefix.should be_nil
  end
  
  it "should have not have a suffix" do
    @event.suffix.should be_nil
  end
end