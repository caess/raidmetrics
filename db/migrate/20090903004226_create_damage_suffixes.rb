class CreateDamageSuffixes < ActiveRecord::Migration
  def self.up
    create_table :damage_suffixes do |t|
      t.integer :amount, :null => false
      t.integer :overkill, :null => false
      t.integer :school, :null => false
      t.integer :resisted, :null => false, :precision => :signed
      t.integer :blocked, :null => false
      t.integer :absorbed, :null => false
      t.integer :critical, :null => false, :limit => 1
      t.integer :glancing, :null => false, :limit => 1
      t.integer :crushing, :null => false, :limit => 1
    end
  end

  def self.down
    drop_table :damage_suffixes
  end
end
