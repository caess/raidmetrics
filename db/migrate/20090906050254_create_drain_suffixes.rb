class CreateDrainSuffixes < ActiveRecord::Migration
  def self.up
    create_table :drain_suffixes do |t|
      t.integer :amount
      t.integer :power_type
      t.integer :extra_amount
    end
  end

  def self.down
    drop_table :drain_suffixes
  end
end
