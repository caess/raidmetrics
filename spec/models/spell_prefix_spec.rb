require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellPrefix do
  before(:each) do
    @valid_attributes = {
      :spell => Spell.new( :name => "Hot Streak", :spell_id => 48108, :school => 0x1 )
    }
  end

  it "should create a new instance given valid attributes" do
    SpellPrefix.create!(@valid_attributes)
  end
  
  it "should not be valid if spell is missing" do
    @valid_attributes[ :spell ] = nil
    
    prefix = SpellPrefix.new( @valid_attributes )
    prefix.should_not be_valid
  end
end
