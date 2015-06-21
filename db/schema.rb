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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150619022503) do

  create_table "vanities", force: :cascade do |t|
    t.string   "vanity_url",      limit: 50
    t.string   "destination_url"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "vanities", ["vanity_url"], name: "index_vanities_on_vanity_url", unique: true

  create_table "vanity_trackings", force: :cascade do |t|
    t.integer  "vanity_id"
    t.string   "ip_address", limit: 50
    t.string   "user_agent", limit: 250
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "vanity_trackings", ["vanity_id"], name: "index_vanity_trackings_on_vanity_id"

end
