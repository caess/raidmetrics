require 'ar-extensions'
require 'ar-extensions/adapters/mysql'
require 'ar-extensions/import/mysql'

class LogFileImporter
  attr_reader :raid
  
  def initialize
    @factory = EventFactory.new
    @events  = []
    @raid    = nil
    
    @chunk_size = 20_000
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
    
    @raid.save!
    
    file.rewind
  end
  
  def import( file, max_lines = nil )
    build_raid( file ) if not @raid
        
    @factory.raid = @raid
    
    count = 0
    
    file.each_line do |line|      
      process( line.strip )
    
      count += 1
      save if count % @chunk_size == 0
    
      break if count == max_lines
    end
    
    save if @events.length > 0
  end
  
  def process( line )
    @events << @factory.build( line )
  end
  
  def save
    #@events.each { |event| event.save! }
    Event.import @events.compact, :validate => false
    
    @events.clear
  end
end
