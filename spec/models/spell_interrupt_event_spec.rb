require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellInterruptEvent do
  before(:each) do
    @event = SpellInterruptEvent.new
  end

  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.should == SpellPrefix
  end
  
  it "should have :suffix be an InterruptSuffix" do
    @event.suffix.class.should == InterruptSuffix
  end
  
  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end
  
  it "should delegate :extra_spell to :suffix" do
    @event.suffix.should_receive( :spell )
    
    @event.extra_spell
  end
end