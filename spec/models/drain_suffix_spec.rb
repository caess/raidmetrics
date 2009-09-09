require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DrainSuffix do
  before(:each) do
    @valid_attributes = {
      :amount => 1,
      :power_type => 1,
      :extra_amount => 1
    }
  end

  it "should create a new instance given valid attributes" do
    DrainSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if the amount is missing" do
    @valid_attributes[ :amount ] = nil
    
    suffix = DrainSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end

  it "should not be valid if the power type is missing" do
    @valid_attributes[ :power_type ] = nil
    
    suffix = DrainSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end

  it "should not be valid if the extra amount is missing" do
    @valid_attributes[ :extra_amount ] = nil
    
    suffix = DrainSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
