class ChangeEventModel < ActiveRecord::Migration
  def self.up
    drop_table :aura_dose_suffixes
    drop_table :aura_suffixes
    drop_table :damage_suffixes
    drop_table :dispel_suffixes
    drop_table :drain_suffixes
    drop_table :enchant_suffixes
    drop_table :energize_suffixes
    drop_table :environmental_type_prefixes
    drop_table :extra_attacks_suffixes
    drop_table :fail_suffixes
    drop_table :heal_suffixes
    drop_table :interrupt_suffixes
    drop_table :miss_suffixes
    drop_table :spell_prefixes
    
    remove_column :events, :prefix_id
    remove_column :events, :prefix_type
    remove_column :events, :suffix_id
    remove_column :events, :suffix_type
    
    add_column :events, :prefix, :integer
    add_column :events, :suffix1, :integer, :precision => :signed
    add_column :events, :suffix2, :integer, :precision => :signed
    add_column :events, :suffix3, :integer, :precision => :signed
    add_column :events, :suffix4, :integer, :precision => :signed
    add_column :events, :suffix5, :integer, :precision => :signed
    add_column :events, :suffix6, :integer, :precision => :signed
    add_column :events, :suffix7, :integer, :precision => :signed
    add_column :events, :suffix8, :integer, :precision => :signed
    add_column :events, :suffix9, :integer, :precision => :signed
  end

  def self.down
    remove_column :events, :suffix9
    remove_column :events, :suffix8
    remove_column :events, :suffix7
    remove_column :events, :suffix6
    remove_column :events, :suffix5
    remove_column :events, :suffix4
    remove_column :events, :suffix3
    remove_column :events, :suffix2
    remove_column :events, :suffix1
    remove_column :events, :prefix
    
    add_column :events, :suffix_type, :string
    add_column :events, :suffix_id, :integer
    add_column :events, :prefix_type, :string
    add_column :events, :prefix_id, :integer
    
    create_table "spell_prefixes", :force => true do |t|
      t.integer "spell_id", :null => false
    end
    
    create_table "miss_suffixes", :force => true do |t|
      t.integer "miss_type_id", :null => false
      t.integer "amount",       :null => false
    end
    
    create_table "interrupt_suffixes", :force => true do |t|
      t.integer "spell_id", :null => false
    end
    
    create_table "heal_suffixes", :force => true do |t|
      t.integer "amount",                             :null => false
      t.integer "overheal",                           :null => false
      t.integer "absorbed",                           :null => false
      t.integer "critical", :limit => 1, :scale => 3, :null => false
    end
    
    create_table "fail_suffixes", :force => true do |t|
      t.integer "fail_type_id"
    end
    
    create_table "extra_attacks_suffixes", :force => true do |t|
      t.integer "amount", :null => false
    end
    
    create_table "environmental_type_prefixes", :force => true do |t|
      t.integer "environmental_type_id", :null => false
    end
    
    create_table "energize_suffixes", :force => true do |t|
      t.integer "amount"
      t.integer "power_type"
    end
    
    create_table "enchant_suffixes", :force => true do |t|
      t.integer "enchant_id", :null => false
      t.integer "item_id",    :null => false
    end
    
    create_table "drain_suffixes", :force => true do |t|
      t.integer "amount"
      t.integer "power_type"
      t.integer "extra_amount"
    end
    
    create_table "dispel_suffixes", :force => true do |t|
      t.integer "spell_id",                           :null => false
      t.integer "buff",     :limit => 1, :scale => 3, :null => false
    end
    
    create_table "damage_suffixes", :force => true do |t|
      t.integer "amount",                                                    :null => false
      t.integer "overkill",                                                  :null => false
      t.integer "school",                                                    :null => false
      t.integer "resisted",              :precision => :signed,              :null => false
      t.integer "blocked",                                                   :null => false
      t.integer "absorbed",                                                  :null => false
      t.integer "critical", :limit => 1,                        :scale => 3, :null => false
      t.integer "glancing", :limit => 1,                        :scale => 3, :null => false
      t.integer "crushing", :limit => 1,                        :scale => 3, :null => false
    end
    
    create_table "aura_suffixes", :force => true do |t|
      t.integer "buff", :limit => 1, :scale => 3, :null => false
    end
    
    create_table "aura_dose_suffixes", :force => true do |t|
      t.integer "buff",   :limit => 1, :scale => 3, :null => false
      t.integer "amount",                           :null => false
    end
    
    
  end
end
