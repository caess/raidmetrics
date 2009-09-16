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
end
