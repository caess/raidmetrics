class FixRaidIdColumnForEncounters < ActiveRecord::Migration
  def self.up
    remove_column :encounters, :raid
    add_column :encounters, :raid_id, :integer
  end

  def self.down
    remove_column :encounters, :raid_id
    add_column :encounters, :raid, :integer
  end
end
