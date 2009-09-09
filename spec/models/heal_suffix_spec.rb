require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HealSuffix do
  before(:each) do
    @valid_attributes = {
      :amount => 1,
      :overheal => 1,
      :absorbed => 1,
      :critical => 1
    }
  end

  it "should create a new instance given valid attributes" do
    HealSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if the amount is missing" do
    @valid_attributes[ :amount ] = nil
    
    suffix = HealSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if the overheal amount is missing" do
    @valid_attributes[ :overheal ] = nil
    
    suffix = HealSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if the absorbed amount is missing" do
    @valid_attributes[ :absorbed ] = nil
    
    suffix = HealSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if the critical flag is missing" do
    @valid_attributes[ :critical ] = nil
    
    suffix = HealSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
