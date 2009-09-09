class AddTimeColumnToRaids < ActiveRecord::Migration
  def self.up
    add_column :raids, :time, :date
  end

  def self.down
    remove_column :raids, :time
  end
end
