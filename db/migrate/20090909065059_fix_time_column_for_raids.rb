class FixTimeColumnForRaids < ActiveRecord::Migration
  def self.up
    change_column :raids, :time, :datetime
  end

  def self.down
    change_column :raids, :time, :date
  end
end
