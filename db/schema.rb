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

ActiveRecord::Schema.define(:version => 20090920190700) do

  create_table "enchants", :force => true do |t|
    t.string "name"
  end

  add_index "enchants", ["name"], :name => "index_enchants_on_name"

  create_table "encounters", :force => true do |t|
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "raid_id"
  end

  add_index "encounters", ["raid_id"], :name => "index_encounters_on_raid_id"

  create_table "environmental_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  add_index "environmental_types", ["name"], :name => "index_environmental_types_on_name"

  create_table "events", :force => true do |t|
    t.integer "raid_id",                                               :null => false
    t.integer "encounter_id"
    t.decimal "offset",            :precision => 8,       :scale => 3, :null => false
    t.integer "source_id"
    t.integer "destination_id"
    t.string  "type"
    t.integer "source_flags"
    t.integer "destination_flags"
    t.integer "prefix1"
    t.integer "suffix1",           :precision => :signed
    t.integer "suffix2",           :precision => :signed
    t.integer "suffix3",           :precision => :signed
    t.integer "suffix4",           :precision => :signed
    t.integer "suffix5",           :precision => :signed
    t.integer "suffix6",           :precision => :signed
    t.integer "suffix7",           :precision => :signed
    t.integer "suffix8",           :precision => :signed
    t.integer "suffix9",           :precision => :signed
  end

  add_index "events", ["destination_id"], :name => "index_events_on_destination_id"
  add_index "events", ["encounter_id"], :name => "index_events_on_encounter_id"
  add_index "events", ["offset"], :name => "index_events_on_offset"
  add_index "events", ["raid_id"], :name => "index_events_on_raid_id"
  add_index "events", ["source_id"], :name => "index_events_on_source_id"
  add_index "events", ["type"], :name => "index_events_on_type"

  create_table "fail_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  add_index "fail_types", ["name"], :name => "index_fail_types_on_name"

  create_table "items", :force => true do |t|
    t.integer "item_id",                 :null => false
    t.string  "name",    :default => "", :null => false
  end

  add_index "items", ["item_id"], :name => "index_items_on_item_id"

  create_table "miss_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  add_index "miss_types", ["name"], :name => "index_miss_types_on_name"

  create_table "raids", :force => true do |t|
    t.string   "note"
    t.datetime "time"
  end

  create_table "spells", :force => true do |t|
    t.string  "name"
    t.integer "spell_id"
    t.integer "school"
  end

  add_index "spells", ["spell_id"], :name => "index_spells_on_spell_id"

  create_table "units", :force => true do |t|
    t.string  "name",                                :default => "", :null => false
    t.integer "guid",     :limit => 8, :scale => 20,                 :null => false
    t.integer "owner_id"
  end

  add_index "units", ["guid"], :name => "index_units_on_guid"
  add_index "units", ["owner_id"], :name => "index_units_on_owner_id"

end
