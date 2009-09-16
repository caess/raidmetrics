require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
  before(:each) do
    @raid = Raid.new( :time => Time.now )
    
    @valid_attributes = {
      :raid => @raid,
      :offset => 0,
      :source => Unit.new,
      :destination => Unit.new
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
  
  it "should not create a new instance if the offset is missing" do
    event = Event.new( :raid => @raid, :source => Unit.new )
    event.should_not be_valid
  end
  
  it "should not create a new instance if the raid is missing" do
    event = Event.new( :offset => 0, :source => Unit.new )
    event.should_not be_valid
  end
  
  it "should be valid even if the source and destination are both nil" do
    event = Event.new( :raid => @raid, :offset => 0, :source => nil, :destination => nil )
    event.should be_valid
  end
  
  it "should have no prefix" do
    event = Event.new( @valid_attributes )
    
    event.prefix.should be_nil
  end
  
  it "should have no suffix" do
    event = Event.new( @valid_attributes )
    
    event.suffix.should be_nil
  end
  
  context "#process" do
    it "should call #process_prefix" do
      event = Event.new( @valid_attributes )
      
      event.should_receive( :process_prefix )
      
      event.process( nil, nil )
    end

    it "should call #process_suffix" do
      event = Event.new( @valid_attributes )
      
      event.should_receive( :process_suffix )
      
      event.process( nil, nil )
    end
  end
end
