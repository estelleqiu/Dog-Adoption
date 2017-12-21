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

ActiveRecord::Schema.define(version: 20171221063804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "type", default: 0
    t.string "title"
    t.datetime "time"
    t.string "place"
    t.string "content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adoptions", force: :cascade do |t|
    t.bigint "animal_id"
    t.bigint "person_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_adoptions_on_animal_id"
    t.index ["person_id"], name: "index_adoptions_on_person_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name", null: false
    t.integer "type", default: 0
    t.integer "year"
    t.integer "gender"
    t.string "variety"
    t.string "character"
    t.string "life_detail"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "joinings", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_joinings_on_activity_id"
    t.index ["person_id"], name: "index_joinings_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "type"
    t.string "name"
    t.integer "gender"
    t.string "phone"
    t.string "story"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
