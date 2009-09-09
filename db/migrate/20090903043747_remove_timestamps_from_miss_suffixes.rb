class RemoveTimestampsFromMissSuffixes < ActiveRecord::Migration
  def self.up
    remove_timestamps :miss_suffixes
  end

  def self.down
    add_timestamps :miss_suffixes
  end
end
