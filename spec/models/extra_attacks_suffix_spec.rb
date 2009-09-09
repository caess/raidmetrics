require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExtraAttacksSuffix do
  before(:each) do
    @valid_attributes = {
      :amount => 1
    }
  end

  it "should create a new instance given valid attributes" do
    ExtraAttacksSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if the amount is missing" do
    @valid_attributes[ :amount ] = nil
    
    suffix = ExtraAttacksSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
