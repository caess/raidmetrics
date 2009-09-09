class CreateExtraAttacksSuffixes < ActiveRecord::Migration
  def self.up
    create_table :extra_attacks_suffixes do |t|
      t.integer :amount, :null => false
    end
  end

  def self.down
    drop_table :extra_attacks_suffixes
  end
end
