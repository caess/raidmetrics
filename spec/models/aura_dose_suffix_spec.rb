require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuraDoseSuffix do
  before(:each) do
    @valid_attributes = {
      :buff => 1,
      :amount => 1
    }
  end

  it "should create a new instance given valid attributes" do
    AuraDoseSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if buff is missing" do
    @valid_attributes[ :buff ] = nil
    
    suffix = AuraDoseSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if amount is missing" do
    @valid_attributes[ :amount ] = nil
    
    suffix = AuraDoseSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should be a buff if buff == 1" do
    suffix = AuraDoseSuffix.new
    suffix.buff = 1
    
    suffix.should be_buff
  end
  
  it "should not be a buff if :buff != 1" do
    suffix = AuraDoseSuffix.new
    suffix.buff = 0
    
    suffix.should_not be_buff
  end
end
