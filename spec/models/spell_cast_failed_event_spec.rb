require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellCastFailedEvent do
  before(:each) do
    @event = SpellCastFailedEvent.new
  end

  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end

  it "should have :suffix be an FailSuffix" do
    @event.suffix.class.to_s.should == "FailSuffix"
  end

  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end
  
  it "should delegate :fail_type to :suffix" do
    @event.suffix.should_receive( :fail_type )
    
    @event.fail_type
  end
end