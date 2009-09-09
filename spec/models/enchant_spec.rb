require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Enchant do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Enchant.create!(@valid_attributes)
  end
  
  it "should not be valid if the name is missing" do
    @valid_attributes[ :name ] = nil
    
    enchant = Enchant.new( @valid_attributes )
    enchant.should_not be_valid
  end
end
