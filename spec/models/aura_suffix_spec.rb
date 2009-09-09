require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuraSuffix do
  before(:each) do
    @valid_attributes = {
      :buff => 1
    }
  end

  it "should create a new instance given valid attributes" do
    AuraSuffix.create!(@valid_attributes)
  end
  
  it "should not create a new instance if the buff is missing" do
    @valid_attributes[ :buff ] = nil
    
    suffix = AuraSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
