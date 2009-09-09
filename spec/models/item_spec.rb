require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Item do
  before(:each) do
    @valid_attributes = {
      :item_id => 1,
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Item.create!(@valid_attributes)
  end
  
  it "should not be valid if the item ID is missing" do
    @valid_attributes[ :item_id ] = nil
    
    item = Item.new( @valid_attributes )
    item.should_not be_valid
  end
  
  it "should not be valid if the name is missing" do
    @valid_attributes[ :name ] = nil
    
    item = Item.new( @valid_attributes )
    item.should_not be_valid
  end
end
