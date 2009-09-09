require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraRemovedDoseEvent do
  before( :each ) do
    @event = SpellAuraRemovedDoseEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end

  it "should have :suffix be an AuraDoseSuffix" do
    @event.suffix.class.to_s.should == "AuraDoseSuffix"
  end

  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end

  it "should delegate :buff? to :suffix" do
    @event.suffix.should_receive( :buff? )
    
    @event.buff?
  end

  it "should delegate :amount to :suffix" do
    @event.suffix.should_receive( :amount )
    
    @event.amount
  end
end