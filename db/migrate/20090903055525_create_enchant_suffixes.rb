class CreateEnchantSuffixes < ActiveRecord::Migration
  def self.up
    create_table :enchant_suffixes do |t|
      t.integer :enchant_id, :null => false
      t.integer :item_id, :null => false
    end
  end

  def self.down
    drop_table :enchant_suffixes
  end
end
