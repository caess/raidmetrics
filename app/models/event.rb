class Event < ActiveRecord::Base
  include MapColumns
  include EventPrefixes
  include EventSuffixes
  
  validates_presence_of :raid
  validates_presence_of :offset
  
  belongs_to :raid, :class_name => "Raid", :foreign_key => "raid_id"
  belongs_to :source, :class_name => "Unit", :foreign_key => "source_id"
  belongs_to :destination, :class_name => "Unit", :foreign_key => "destination_id"
  
  def process( factory, line )
    process_prefix( factory, line )
    process_suffix( factory, line )
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
    if self.type.nil? or self.type == 'Event'
      'UNKNOWN'
    else
      self.type.scan( /[A-Z][a-z]+/ ).slice( 0..-2 ).join( '_' ).upcase
    end
  end
  
  def to_s
    "|%9.3f %s From: %s To: %s" % [ self.offset, self.event_type, source_string, destination_string ]
  end
  
private
  def source_string
    unit_string( self.source, self.source_flags )
  end
  
  def destination_string
    unit_string( self.destination, self.destination_flags )
  end
  
  def unit_string( unit, flags )
    if unit.nil?
      'nil'
    else
      '%s (%016x,%x)' % [ unit.name, unit.guid, flags || 0 ]
    end    
  end
end
