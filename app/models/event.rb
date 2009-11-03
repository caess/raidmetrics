class Event < ActiveRecord::Base
  include MapColumns
  include EventPrefixes
  include EventSuffixes
  
  validates_presence_of :raid
  validates_presence_of :offset
  
  belongs_to :raid, :class_name => "Raid", :foreign_key => "raid_id"
  belongs_to :source, :class_name => "Unit", :foreign_key => "source_id"
  belongs_to :destination, :class_name => "Unit", :foreign_key => "destination_id"
  
  def process( factory, raid, line )
    process_base_information( factory, raid, line )
    process_prefix( factory, line )
    process_suffix( factory, line )
  end

  def process_base_information( factory, raid, line )
    self.raid = raid

    time = Time.parse( line.first + " " + line.second )
    self.offset = time - raid.time

    self.source = factory.unit( line.fourth.hex, line.fifth )
    self.source_flags = line.sixth.hex
    self.destination = factory.unit( line.seventh.hex, line.eighth )
    self.destination_flags = line.ninth.hex

    line.slice!( 0..8 )
  end
  
  def process_prefix( factory, line )
    # Empty method.
  end
  
  def process_suffix( factory, line )
    # Empty method.
  end
  
  def prefix
    nil
  end
  
  def suffix
    nil
  end
  
  def event_type
    type = read_attribute( :type )

    if type.nil? or type == 'Event'
      'UNKNOWN'
    else
      type.scan( /[A-Z][a-z]+/ ).slice( 0..-2 ).join( '_' ).upcase
    end
  end
  
  def to_s
    "|%9.3f %s From: %s To: %s" % [ self.offset, self.event_type, source_string, destination_string ]
  end
  
private
  def source_string
    Event.unit_string( self.source, self.source_flags )
  end
  
  def destination_string
    Event.unit_string( self.destination, self.destination_flags )
  end
  
  def Event.unit_string( unit, flags )
    if unit.nil?
      'nil'
    else
      '%s (%016x,%x)' % [ unit.name, unit.guid, flags || 0 ]
    end    
  end
end
