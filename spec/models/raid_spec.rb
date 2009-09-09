require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Raid do
  before(:each) do
    @valid_attributes = {
      :time => Time.now,
      :note => "value for note"
    }
  end

  it "should create a new instance given valid attributes" do
    Raid.create!(@valid_attributes)
  end
  
  it "should not create a new instance if no time is given" do
    raid = Raid.new( :note => "Value for note" )
    raid.should_not be_valid
  end
end
