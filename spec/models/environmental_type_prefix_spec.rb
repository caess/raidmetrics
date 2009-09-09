require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnvironmentalTypePrefix do
  before(:each) do
    @valid_attributes = {
      :environmental_type => EnvironmentalType.create!( :name => "Foo" )
    }
  end

  it "should create a new instance given valid attributes" do
    EnvironmentalTypePrefix.create!(@valid_attributes)
  end
  
  it "should not be valid if the environmental type is missing" do
    @valid_attributes[ :environmental_type ] = nil
    
    prefix = EnvironmentalTypePrefix.new( @valid_attributes )
    prefix.should_not be_valid
  end
end
