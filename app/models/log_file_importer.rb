class LogFileImporter
  attr_reader :raid
  
  def initialize
    @factory = EventFactory.new
    @events  = []
    @raid    = nil
  end
  
  def raid=( raid )
    @raid = raid
    
    @factory.raid = @raid
  end
  
  def build_raid( file )
    @raid = Raid.new
    
    line = file.gets
    line =~ /^(\d+\/\d+ \d+:\d+:\d+)\./
    
    @raid.time = Time.parse( $1 )
    
    file.rewind
  end
  
  def import( file )
    build_raid( file ) if not @raid
        
    @factory.raid = @raid
    
    file.each_line do |line|      
      process( line.strip )      
    end
    
    save
  end
  
  def process( line )
    @events << @factory.build( line )
  end
  
  def save
    @events.each { |event| event.save! }
  end
end