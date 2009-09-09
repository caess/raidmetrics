class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :item_id, :null => false
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :items
  end
end
