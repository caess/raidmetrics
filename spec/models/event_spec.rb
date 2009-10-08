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
    
    @event = Event.new( @valid_attributes )
  end

  it "should create a new instance given valid attributes" do
    @event.should be_valid
  end
  
  it "should not create a new instance if the offset is missing" do
    @event.offset = nil
    @event.should_not be_valid
  end
  
  it "should not create a new instance if the raid is missing" do
    @event.raid = nil
    @event.should_not be_valid
  end
  
  it "should be valid even if the source and destination are both nil" do
    @event.source = nil
    @event.destination = nil
    @event.should be_valid
  end
  
  it "should have no prefix" do
    @event.prefix.should be_nil
  end
  
  it "should have no suffix" do
    @event.suffix.should be_nil
  end
  
  context "#process" do
    it "should call #process_prefix" do
      @event.should_receive( :process_prefix )
      
      @event.process( nil, nil )
    end

    it "should call #process_suffix" do
      @event.should_receive( :process_suffix )
      
      @event.process( nil, nil )
    end
  end
end
