require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DamageSuffix do
  before(:each) do
    @valid_attributes = {
      :amount   => 0,
      :overkill => 0,
      :school   => 0,
      :resisted => 0,
      :blocked  => 0,
      :absorbed => 0,
      :critical => 0,
      :glancing => 0,
      :crushing => 0
    }
  end

  it "should create a new instance given valid attributes" do
    DamageSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if amount is missing" do
    @valid_attributes[ :amount ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if overkill is missing" do
    @valid_attributes[ :overkill ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if school is missing" do
    @valid_attributes[ :school ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if resisted is missing" do
    @valid_attributes[ :resisted ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if blocked is missing" do
    @valid_attributes[ :blocked ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if absorbed is missing" do
    @valid_attributes[ :absorbed ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if critical is missing" do
    @valid_attributes[ :critical ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if glancing is missing" do
    @valid_attributes[ :glancing ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if crushing is missing" do
    @valid_attributes[ :crushing ] = nil
    
    suffix = DamageSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
