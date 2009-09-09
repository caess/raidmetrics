class AddColumntsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :type, :string
    add_column :events, :prefix, :integer
    add_column :events, :suffix1, :integer
    add_column :events, :suffix2, :integer
    add_column :events, :suffix3, :integer
    add_column :events, :suffix4, :integer
    add_column :events, :suffix5, :integer
    add_column :events, :suffix6, :integer
    add_column :events, :suffix7, :integer
    add_column :events, :suffix8, :integer
    add_column :events, :suffix9, :integer
  end

  def self.down
    remove_column :events, :suffix9
    remove_column :events, :suffix8
    remove_column :events, :suffix7
    remove_column :events, :suffix6
    remove_column :events, :suffix5
    remove_column :events, :suffix4
    remove_column :events, :suffix3
    remove_column :events, :suffix2
    remove_column :events, :suffix1
    remove_column :events, :prefix
    remove_column :events, :type
  end
end
