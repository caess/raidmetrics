class FixSuffixTypeColumnForEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :suffix_name
    add_column :events, :suffix_type, :string
  end

  def self.down
    remove_column :events, :suffix_type
    add_column :events, :suffix_name, :string
  end
end
