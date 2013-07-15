# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130711145243) do

  create_table "computers", :force => true do |t|
    t.string   "computer_model"
    t.string   "comp_type"
    t.string   "comp_class"
    t.string   "platform"
    t.string   "processor"
    t.float    "memory"
    t.float    "hdd"
    t.string   "display"
    t.string   "source"
    t.date     "commissioning"
    t.string   "task"
    t.date     "decommissioning"
    t.string   "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "station_id"
    t.integer  "district_id"
    t.integer  "region_id"
  end

  add_index "computers", ["station_id"], :name => "index_computers_on_station_id"

  create_table "devices", :force => true do |t|
    t.string   "device_type"
    t.string   "device_model"
    t.string   "source"
    t.date     "commissioning"
    t.string   "task"
    t.date     "decommissioning"
    t.string   "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "station_id"
    t.integer  "district_id"
    t.integer  "region_id"
  end

  add_index "devices", ["district_id"], :name => "index_devices_on_district_id"
  add_index "devices", ["station_id"], :name => "index_devices_on_station_id"

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "region_id"
  end

  create_table "modems", :force => true do |t|
    t.string   "model"
    t.string   "modem_type"
    t.string   "speed"
    t.string   "source"
    t.date     "commissioning"
    t.string   "task"
    t.date     "decommissioning"
    t.string   "comment"
    t.integer  "station_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "district_id"
    t.integer  "region_id"
  end

  add_index "modems", ["station_id"], :name => "index_modems_on_station_id"

  create_table "printers", :force => true do |t|
    t.string   "device"
    t.string   "printer_model"
    t.string   "printer_type"
    t.string   "page_format"
    t.string   "chroma"
    t.string   "source"
    t.date     "commissioning"
    t.string   "task"
    t.date     "decommissioning"
    t.string   "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "station_id"
    t.integer  "district_id"
    t.integer  "region_id"
  end

  add_index "printers", ["station_id"], :name => "index_printers_on_station_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "republics", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "region_id"
  end

  add_index "stations", ["district_id"], :name => "index_stations_on_district_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
