require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellAuraBrokenSpellEvent do
  before( :each ) do
    @event = SpellAuraBrokenSpellEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end
  
  it "should have :suffix be a DispelSuffix" do
    @event.suffix.class.to_s.should == "DispelSuffix"
  end

  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end

  it "should delegate :extra_spell to :suffix" do
    @event.suffix.should_receive( :spell )
    
    @event.extra_spell
  end

  it "should delegate :buff? to :suffix" do
    @event.suffix.should_receive( :buff? )
    
    @event.buff?
  end
end