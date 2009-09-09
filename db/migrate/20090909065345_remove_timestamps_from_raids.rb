class RemoveTimestampsFromRaids < ActiveRecord::Migration
  def self.up
    remove_timestamps :raids
  end

  def self.down
    add_timestamps :raids
  end
end
