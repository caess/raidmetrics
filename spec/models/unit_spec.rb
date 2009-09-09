require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Unit do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :guid => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Unit.create!(@valid_attributes)
  end
  
  it "should not create a new instance if the name is missing" do
    unit = Unit.new( :guid => 1 )
    unit.should_not be_valid
  end
  
  it "should not create a new instance if the guid is missing" do
    unit = Unit.new( :name => "Foo" )
    unit.should_not be_valid
  end
end
