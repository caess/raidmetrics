require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
  before(:each) do
    @raid = Raid.new( :time => Time.now )
    
    @valid_attributes = {
      :raid => @raid,
      :offset => 0,
      :source => Unit.new( :name => "Placeholder", :guid => 0 ),
      :destination => Unit.new( :name => "Placeholder", :guid => 0 )
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
      @event.stub!( :process_base_information )
      @event.should_receive( :process_prefix )
      
      @event.process( nil, nil, nil )
    end

    it "should call #process_suffix" do
      @event.stub!( :process_base_information )
      @event.should_receive( :process_suffix )
      
      @event.process( nil, nil, nil )
    end
  end
  
  it "should have an event type of 'UNKNOWN'" do
    @event.event_type.should == 'UNKNOWN'
  end
  
  context "#to_s" do
    it "should contain the offset" do
      @event.to_s.should contain( '%9.3f' % @event.offset )
    end
    
    it "should contain the event type" do
      @event.to_s.should contain( @event.event_type )
    end
    
    it "should contain the name of the source" do
      @event.source = Unit.new( :name => "Phaedra", :guid => 0x0200000000322CF9 )
      
      @event.to_s.should contain( "Phaedra" )
    end
    
    it "should contain the GUID of the source" do
      @event.source = Unit.new( :name => "Phaedra", :guid => 0x0200000000322CF9 )
      
      @event.to_s.should contain( "0200000000322cf9" )
    end
    
    it "should contain the source flags" do
      @event.source_flags = 0x514
      
      @event.to_s.should contain( "514" )
    end
    
    it "should contain 'nil' if the source is nil" do
      @event.source = nil
      
      @event.to_s.should contain( "nil" )
    end
    
    it "should contain the name of the destination" do
      @event.destination = Unit.new( :name => "Phaedra", :guid => 0x0200000000322CF9 )
      
      @event.to_s.should contain( "Phaedra" )
    end
    
    it "should contain the GUID of the destination" do
      @event.destination = Unit.new( :name => "Phaedra", :guid => 0x0200000000322CF9 )
      
      @event.to_s.should contain( "0200000000322cf9" )
    end

    it "should contain the destination flags" do
      @event.destination_flags = 0x514
      
      @event.to_s.should contain( "514" )
    end
    
    it "should contain 'nil' if the source is nil" do
      @event.destination = nil
      
      @event.to_s.should contain( "nil" )
    end
  end
end
