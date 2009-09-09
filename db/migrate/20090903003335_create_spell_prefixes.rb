class CreateSpellPrefixes < ActiveRecord::Migration
  def self.up
    create_table :spell_prefixes do |t|
      t.integer :spell_id, :null => false
    end
  end

  def self.down
    drop_table :spell_prefixes
  end
end
