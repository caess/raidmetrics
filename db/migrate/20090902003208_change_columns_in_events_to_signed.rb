class ChangeColumnsInEventsToSigned < ActiveRecord::Migration
  def self.up
    change_column :events, :suffix1, :integer, :precision => :signed
    change_column :events, :suffix2, :integer, :precision => :signed
    change_column :events, :suffix3, :integer, :precision => :signed
    change_column :events, :suffix4, :integer, :precision => :signed
    change_column :events, :suffix5, :integer, :precision => :signed
    change_column :events, :suffix6, :integer, :precision => :signed
    change_column :events, :suffix7, :integer, :precision => :signed
    change_column :events, :suffix8, :integer, :precision => :signed
    change_column :events, :suffix9, :integer, :precision => :signed
  end

  def self.down
    change_column :events, :suffix9, :integer
    change_column :events, :suffix8, :integer
    change_column :events, :suffix7, :integer
    change_column :events, :suffix6, :integer
    change_column :events, :suffix5, :integer
    change_column :events, :suffix4, :integer
    change_column :events, :suffix3, :integer
    change_column :events, :suffix2, :integer
    change_column :events, :suffix1, :integer
  end
end
