class RenamePrefixColumnInEvents < ActiveRecord::Migration
  def self.up
    rename_column :events, :prefix, :prefix1
  end

  def self.down
    rename_column :events, :prefix1, :prefix
  end
end
