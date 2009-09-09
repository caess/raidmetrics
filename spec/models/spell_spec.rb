require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Spell do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :spell_id => 1,
      :school => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Spell.create!(@valid_attributes)
  end
  
  it "should not create a new instance if the name is missing" do
    attributes = @valid_attributes
    attributes[ :name ] = nil
    
    spell = Spell.new( attributes )
    spell.should_not be_valid
  end
  
  it "should not create a new instance if the spell ID is missing" do
    attributes = @valid_attributes
    attributes[ :spell_id ] = nil
    
    spell = Spell.new( attributes )
    spell.should_not be_valid
  end
  
  it "should not create a new instance if the school is missing" do
    attributes = @valid_attributes
    attributes[ :school ] = nil
    
    spell = Spell.new( attributes )
    spell.should_not be_valid
  end
end
