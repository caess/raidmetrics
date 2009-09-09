class CreateMissSuffixes < ActiveRecord::Migration
  def self.up
    create_table :miss_suffixes do |t|
      t.integer :miss_type_id, :null => false
      t.integer :amount, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :miss_suffixes
  end
end
