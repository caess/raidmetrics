class CreateDispelSuffixes < ActiveRecord::Migration
  def self.up
    create_table :dispel_suffixes do |t|
      t.integer :spell_id, :null => false
      t.integer :buff, :limit => 1, :null => false
    end
  end

  def self.down
    drop_table :dispel_suffixes
  end
end
