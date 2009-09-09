require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellPeriodicDamageEvent do
  before(:each) do
    @event = SpellPeriodicDamageEvent.new
  end
  
  it "should have :prefix be a SpellPrefix" do
    @event.prefix.class.to_s.should == "SpellPrefix"
  end
  
  it "should have :suffix be a DamageSuffix" do
    @event.suffix.class.to_s.should == "DamageSuffix"
  end
  
  it "should delegate :spell to :prefix" do
    @event.prefix.should_receive( :spell )
    
    @event.spell
  end
  
  it "should delegate :amount to :suffix" do
    @event.suffix.should_receive( :amount )
    
    @event.amount
  end
  
  it "should delegate :overkill to :suffix" do
    @event.suffix.should_receive( :overkill )
    
    @event.overkill
  end
  
  it "should delegate :school to :suffix" do
    @event.suffix.should_receive( :school )
    
    @event.school
  end
  
  it "should delegate :resisted to :suffix" do
    @event.suffix.should_receive( :resisted )
    
    @event.resisted
  end
  
  it "should delegate :blocked to :suffix" do
    @event.suffix.should_receive( :blocked )
    
    @event.blocked
  end
  
  it "should delegate :absorbed to :suffix" do
    @event.suffix.should_receive( :absorbed )
    
    @event.absorbed
  end
    
  it "should delegate :critical? to :suffix" do
    @event.suffix.should_receive( :critical? )
    
    @event.critical?
  end
  
  it "should delegate :glancing? to :suffix" do
    @event.suffix.should_receive( :glancing? )
    
    @event.glancing?
  end
  
  it "should delegate :crushing? to :suffix" do
    @event.suffix.should_receive( :crushing? )
    
    @event.crushing?
  end
end