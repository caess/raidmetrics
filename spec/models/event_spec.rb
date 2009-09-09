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
  
  it "should not create a new instance if both the source and destination are missing" do
    event = Event.new( :raid => @raid, :offset => 0 )
    event.should_not be_valid
  end
  
  context "#process" do
    before( :each ) do
      @factory = mock( "EventFactory" )
      
      @args = "Foo"
      
      @event = Event.new
    end
    
    it "should call prefix#process" do
      prefix = SpellPrefix.new
      prefix.should_receive( :process ).with( @factory, @args )
      
      @event.prefix = prefix
      
      @event.process( @factory, @args )
    end
    
    it "should call suffix#process" do
      suffix = AuraSuffix.new
      suffix.should_receive( :process ).with( @factory, @args )
      
      @event.suffix = suffix
      
      @event.process( @factory, @args )
    end
  end
end
