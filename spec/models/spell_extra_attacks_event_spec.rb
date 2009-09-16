require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellExtraAttacksEvent do
  before(:each) do
    @event = SpellExtraAttacksEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an EXTRA_ATTACKS suffix" do
    @event.suffix.should == "EXTRA_ATTACKS"
  end
end