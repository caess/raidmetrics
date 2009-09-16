require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellEnergizeEvent do
  before( :each ) do
    @event = SpellEnergizeEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have an ENERGIZE suffix" do
    @event.suffix.should == "ENERGIZE"
  end
end