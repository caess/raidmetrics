class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :events, :offset
    add_index :events, :raid_id
    add_index :events, :encounter_id
    add_index :events, :source_id
    add_index :events, :destination_id
    add_index :events, :type
    
    add_index :enchants, :name
    
    add_index :encounters, :raid_id
    
    add_index :environmental_types, :name
    
    add_index :fail_types, :name
    
    add_index :items, :item_id
    
    add_index :miss_types, :name
    
    add_index :spells, :spell_id
    
    add_index :units, :guid
    add_index :units, :owner_id
  end

  def self.down
    remove_index :units, :owner_id
    remove_index :units, :guid
    remove_index :spells, :spell_id
    remove_index :miss_types, :name
    remove_index :items, :item_id
    remove_index :fail_types, :name
    remove_index :environmental_types, :name
    remove_index :encounters, :raid_id
    remove_index :enchants, :name
    remove_index :events, :type
    remove_index :events, :destination_id
    remove_index :events, :source_id
    remove_index :events, :encounter_id
    remove_index :events, :raid_id
    remove_index :events, :offset
  end
end
