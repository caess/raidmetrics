require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DispelSuffix do
  before(:each) do
    @valid_attributes = {
      :spell => Spell.new( :name => "Hot Streak", :spell_id => 48108, :school => 0x1 ),
      :buff => 1
    }
  end

  it "should create a new instance given valid attributes" do
    DispelSuffix.create!(@valid_attributes)
  end
  
  it "should not be valid if the spell is missing" do
    @valid_attributes[ :spell ] = nil
    
    suffix = DispelSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
  
  it "should not be valid if the buff field is missing" do
    @valid_attributes[ :buff ] = nil
    
    suffix = DispelSuffix.new( @valid_attributes )
    suffix.should_not be_valid
  end
end
