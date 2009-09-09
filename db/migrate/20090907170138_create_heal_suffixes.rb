class CreateHealSuffixes < ActiveRecord::Migration
  def self.up
    create_table :heal_suffixes do |t|
      t.integer :amount, :null => false
      t.integer :overheal, :null => false
      t.integer :absorbed, :null => false
      t.integer :critical, :limit => 1, :null => false
    end
  end

  def self.down
    drop_table :heal_suffixes
  end
end
