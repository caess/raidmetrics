require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellCastSuccessEvent do
  before(:each) do
    @event = SpellCastSuccessEvent.new
  end

  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end

  it "should not have a suffix" do
    @event.suffix.should be_nil
  end

  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end
end