class RemoveColumnsFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :prefix
    remove_column :events, :suffix1
    remove_column :events, :suffix2
    remove_column :events, :suffix3
    remove_column :events, :suffix4
    remove_column :events, :suffix5
    remove_column :events, :suffix6
    remove_column :events, :suffix7
    remove_column :events, :suffix8
    remove_column :events, :suffix9
  end

  def self.down
    add_column :events, :suffix9, :integer,           :precision => :signed
    add_column :events, :suffix8, :integer,           :precision => :signed
    add_column :events, :suffix7, :integer,           :precision => :signed
    add_column :events, :suffix6, :integer,           :precision => :signed
    add_column :events, :suffix5, :integer,           :precision => :signed
    add_column :events, :suffix4, :integer,           :precision => :signed
    add_column :events, :suffix3, :integer,           :precision => :signed
    add_column :events, :suffix2, :integer,           :precision => :signed
    add_column :events, :suffix1, :integer, :precision => :signed
    add_column :events, :prefix, :integer
  end
end
