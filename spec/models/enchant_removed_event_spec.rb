require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnchantRemovedEvent do
  before(:each) do
    @event = EnchantRemovedEvent.new
  end
  
  it "should have an ENCHANT prefix" do
    @event.prefix.should == "ENCHANT"
  end
  
  it "should have not have a suffix" do
    @event.suffix.should be_nil
  end
end