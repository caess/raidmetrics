require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FailSuffix do
  before(:each) do
    @valid_attributes = {
      :fail_type => FailType.new( :name => "Foo" )
    }
  end

  it "should create a new instance given valid attributes" do
    FailSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if the fail type is missing" do
    @valid_attributes[ :fail_type ] = nil
    
    suffix = FailSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
