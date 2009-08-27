require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Encounter do
  before(:each) do
    @raid = Raid.create!
    
    @valid_attributes = {
      :raid => @raid,
      :note => "value for note"
    }
  end

  it "should create a new instance given valid attributes" do
    Encounter.create!(@valid_attributes)
  end
  
  it "should not be valid if no raid is specified" do
    encounter = Encounter.new( :note => "note" )
    encounter.should_not be_valid
  end
end
