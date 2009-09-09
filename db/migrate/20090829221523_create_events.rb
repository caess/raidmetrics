class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :raid_id, :null => false
      t.integer :encounter_id
      t.decimal :offset, :precision => 8, :scale => 3, :null => false
      t.integer :source_id
      t.integer :destination_id
    end
  end

  def self.down
    drop_table :events
  end
end
