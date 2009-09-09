class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string :name, :null => false
      t.integer :guid, :limit => 8, :precision => :unsigned, :null => false
      t.integer :owner_id
    end
  end

  def self.down
    drop_table :units
  end
end
