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

ActiveRecord::Schema.define(version: 2018_10_15_083631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "strength"
    t.integer "experience"
    t.integer "level"
    t.integer "available_upgrade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "winner_punches"
    t.integer "looser_punches"
    t.integer "victory_type"
    t.integer "rounds"
    t.bigint "winner_id"
    t.bigint "looser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["looser_id"], name: "index_fights_on_looser_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

end
