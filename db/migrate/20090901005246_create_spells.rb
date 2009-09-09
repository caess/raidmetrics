class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.string :name
      t.integer :spell_id
      t.integer :school
    end
  end

  def self.down
    drop_table :spells
  end
end
