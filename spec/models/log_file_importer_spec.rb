require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'stringio'

describe LogFileImporter do
  before( :each ) do
    @importer = LogFileImporter.new
    
    @log_line = '7/2 23:07:17.378  SPELL_AURA_REMOVED,0x0200000000322CF9,"Phaedra",0x511,0x0200000000322CF9,"Phaedra",0x511,48108,"Hot Streak",0x1,BUFF'
  end
  
  it "should not have a default raid" do
    importer = LogFileImporter.new
    importer.raid.should be_nil
  end
  
  it "should assign a time to the raid when creating a new one" do
    file = StringIO.new( @log_line + "\n")
    
    @importer.raid = nil
    @importer.import( file )
    @importer.raid.time.should == Time.parse( '7/2 23:07:17' )
  end
  
  context "#import" do
    it "should read the lines of the file" do
      file = mock( "File", :null_object => true )
      file.should_receive( :each_line )
      file.stub!( :gets ).and_return @log_line
      
      @importer.import( file )
    end
    
    context "when a raid has not already been assigned" do    
      it "should create a raid" do
        file = mock( "File", :null_object => true )
        file.stub!( :gets ).and_return @log_line
      
        @importer.raid = nil
        @importer.import( file )
        @importer.raid.should_not be_nil
      end
      
      it "should assign the time to the raid" do
        file = StringIO.new( @log_line + "\n")
        
        @importer.raid = nil
        @importer.import( file )
        @importer.raid.time.should == Time.parse( '7/2 23:07:17' )
      end
    end
    
    it "should not create a raid if one has already been assigned" do
      file = mock( "File", :null_object => true )
      
      raid = Raid.new
      @importer.raid = raid
      @importer.import( file )
      @importer.raid.should equal( raid )
    end    
  end
  
  context "#process" do
    it "should create an event from the line given" do
      @importer.raid = Raid.new( :time => Time.parse( '7/2 23:07:17' ) )
      
      event = @importer.process( @log_line )
      event.should_not be_nil
    end
  end
end