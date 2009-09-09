require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnchantRemovedEvent do
  before(:each) do
    @event = EnchantRemovedEvent.new
  end
  
  it "should have :prefix be nil" do
    @event.prefix.should be_nil
  end
  
  it "should have :suffix be an EnchantSuffix" do
    @event.suffix.class.to_s.should == "EnchantSuffix"
  end
  
  it "should delegate :enchant to :suffix" do
    @event.suffix.should_receive( :enchant )
    
    @event.enchant
  end
  
  it "should delegate :item to :suffix" do
    @event.suffix.should_receive( :item )
    
    @event.item
  end
end