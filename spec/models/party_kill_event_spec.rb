require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PartyKillEvent do
  before(:each) do
    @event = PartyKillEvent.new
  end
  
  it "should have not have a prefix" do
    @event.prefix.should be_nil
  end
  
  it "should have not have a suffix" do
    @event.suffix.should be_nil
  end
end