class Event < ActiveRecord::Base
  validates_presence_of :raid
  validates_presence_of :offset
  validate :valid_units?
  
  belongs_to :raid, :class_name => "Raid", :foreign_key => "raid_id"
  belongs_to :source, :class_name => "Unit", :foreign_key => "source_id"
  belongs_to :destination, :class_name => "Unit", :foreign_key => "destination_id"
  
  belongs_to :prefix, :polymorphic => true
  belongs_to :suffix, :polymorphic => true
  
  def prepare
  end
  
  def process( factory, line )
    self.prefix.process( factory, line ) if self.prefix
    self.suffix.process( factory, line ) if self.suffix
  end
  
private
  def valid_units?
    if source.nil? and destination.nil?
      errors.add_to_base( "An event must have a source and/or a destination." )
    end
  end
end
