class AddUnitFlagColumnsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :source_flags, :integer
    add_column :events, :destination_flags, :integer
  end

  def self.down
    remove_column :events, :destination_flags
    remove_column :events, :source_flags
  end
end
