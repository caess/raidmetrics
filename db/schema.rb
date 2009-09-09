# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090909065409) do

  create_table "aura_dose_suffixes", :force => true do |t|
    t.integer "buff",   :limit => 1, :scale => 3, :null => false
    t.integer "amount",                           :null => false
  end

  create_table "aura_suffixes", :force => true do |t|
    t.integer "buff", :limit => 1, :scale => 3, :null => false
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

  create_table "dispel_suffixes", :force => true do |t|
    t.integer "spell_id",                           :null => false
    t.integer "buff",     :limit => 1, :scale => 3, :null => false
  end

  create_table "drain_suffixes", :force => true do |t|
    t.integer "amount"
    t.integer "power_type"
    t.integer "extra_amount"
  end

  create_table "enchant_suffixes", :force => true do |t|
    t.integer "enchant_id", :null => false
    t.integer "item_id",    :null => false
  end

  create_table "enchants", :force => true do |t|
    t.string "name"
  end

  create_table "encounters", :force => true do |t|
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "raid_id"
  end

  create_table "energize_suffixes", :force => true do |t|
    t.integer "amount"
    t.integer "power_type"
  end

  create_table "environmental_type_prefixes", :force => true do |t|
    t.integer "environmental_type_id", :null => false
  end

  create_table "environmental_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "events", :force => true do |t|
    t.integer "raid_id",                                         :null => false
    t.integer "encounter_id"
    t.decimal "offset",            :precision => 8, :scale => 3, :null => false
    t.integer "source_id"
    t.integer "destination_id"
    t.string  "type"
    t.integer "source_flags"
    t.integer "destination_flags"
    t.integer "prefix_id"
    t.string  "prefix_type"
    t.integer "suffix_id"
    t.string  "suffix_type"
  end

  create_table "extra_attacks_suffixes", :force => true do |t|
    t.integer "amount", :null => false
  end

  create_table "fail_suffixes", :force => true do |t|
    t.integer "fail_type_id"
  end

  create_table "fail_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "heal_suffixes", :force => true do |t|
    t.integer "amount",                             :null => false
    t.integer "overheal",                           :null => false
    t.integer "absorbed",                           :null => false
    t.integer "critical", :limit => 1, :scale => 3, :null => false
  end

  create_table "interrupt_suffixes", :force => true do |t|
    t.integer "spell_id", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer "item_id",                 :null => false
    t.string  "name",    :default => "", :null => false
  end

  create_table "miss_suffixes", :force => true do |t|
    t.integer "miss_type_id", :null => false
    t.integer "amount",       :null => false
  end

  create_table "miss_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "raids", :force => true do |t|
    t.string   "note"
    t.datetime "time"
  end

  create_table "spell_prefixes", :force => true do |t|
    t.integer "spell_id", :null => false
  end

  create_table "spells", :force => true do |t|
    t.string  "name"
    t.integer "spell_id"
    t.integer "school"
  end

  create_table "units", :force => true do |t|
    t.string  "name",                                :default => "", :null => false
    t.integer "guid",     :limit => 8, :scale => 20,                 :null => false
    t.integer "owner_id"
  end

end
