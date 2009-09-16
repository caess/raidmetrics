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

ActiveRecord::Schema.define(:version => 20090915234727) do

  create_table "enchants", :force => true do |t|
    t.string "name"
  end

  create_table "encounters", :force => true do |t|
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "raid_id"
  end

  create_table "environmental_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

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

  create_table "fail_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer "item_id",                 :null => false
    t.string  "name",    :default => "", :null => false
  end

  create_table "miss_types", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "raids", :force => true do |t|
    t.string   "note"
    t.datetime "time"
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
