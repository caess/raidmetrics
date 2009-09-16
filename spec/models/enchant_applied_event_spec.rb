require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnchantAppliedEvent do
  before(:each) do
    @event = EnchantAppliedEvent.new
  end
  
  it "should have an ENCHANT prefix" do
    @event.prefix.should == "ENCHANT"
  end
  
  it "should not have a suffix" do
    @event.suffix.should be_nil
  end
end