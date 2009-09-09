class CreateEnergizeSuffixes < ActiveRecord::Migration
  def self.up
    create_table :energize_suffixes do |t|
      t.integer :amount
      t.integer :power_type
    end
  end

  def self.down
    drop_table :energize_suffixes
  end
end
