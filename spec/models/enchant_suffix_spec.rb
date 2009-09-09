require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnchantSuffix do
  before(:each) do
    @valid_attributes = {
      :enchant => Enchant.new( :name => "Foo" ),
      :item => Item.new( :name => "Item", :item_id => 1 )
    }
  end

  it "should create a new instance given valid attributes" do
    EnchantSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if the enchant is missing" do
    @valid_attributes[ :enchant ] = nil
    
    suffix = EnchantSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if the item is missing" do
    @valid_attributes[ :item ] = nil
    
    suffix = EnchantSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
