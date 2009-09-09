require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MissSuffix do
  before(:each) do
    @valid_attributes = {
      :miss_type => MissType.new( :name => "Foo" ),
      :amount => 1
    }
  end

  it "should create a new instance given valid attributes" do
    MissSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if the miss type is missing" do
    @valid_attributes[ :miss_type ] = nil
    
    suffix = MissSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if the amount is missing" do
    @valid_attributes[ :amount ] = nil
    
    suffix = MissSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
