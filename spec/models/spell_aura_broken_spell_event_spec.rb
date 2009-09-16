require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraBrokenSpellEvent do
  before( :each ) do
    @event = SpellAuraBrokenSpellEvent.new
  end
  
  it "should have a SPELL prefix" do
    @event.prefix.should == "SPELL"
  end
  
  it "should have a DISPEL suffix" do
    @event.suffix.should == "DISPEL"
  end
end