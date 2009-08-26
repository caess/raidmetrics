require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Raid do
  before(:each) do
    @valid_attributes = {
      :note => "value for note"
    }
  end

  it "should create a new instance given valid attributes" do
    Raid.create!(@valid_attributes)
  end
end
