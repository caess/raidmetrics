require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnvironmentalType do
  before(:each) do
    @valid_attributes = {
      :name => "Foo"
    }
  end

  it "should create a new instance given valid attributes" do
    EnvironmentalType.create!(@valid_attributes)
  end
  
  it "should not be valid if the name is missing" do
    @valid_attributes[ :name ] = nil
    
    environmental_type = EnvironmentalType.new( @valid_attributes )
    environmental_type.should_not be_valid
  end
end
