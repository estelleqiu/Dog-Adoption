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

ActiveRecord::Schema.define(version: 20180307084741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "activity_type", default: 0
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
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
    t.string "story"
    t.index ["animal_id"], name: "index_adoptions_on_animal_id"
    t.index ["person_id"], name: "index_adoptions_on_person_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name", null: false
    t.integer "animal_type", default: 0
    t.date "birth_date"
    t.integer "gender"
    t.string "variety"
    t.string "character"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "description"
    t.boolean "is_vaccined", default: false
    t.boolean "is_sterilizationed", default: false
    t.string "size"
  end

  create_table "experineces", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "original_url"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_experineces_on_person_id"
  end

  create_table "fee_reports", force: :cascade do |t|
    t.string "item_name"
    t.integer "item_kind"
    t.integer "fee_type"
    t.integer "quantity"
    t.string "information_url"
    t.string "director"
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

  create_table "media", force: :cascade do |t|
    t.string "url", default: "http://p4wgbyuaw.bkt.clouddn.com/default_avatar.jpg"
    t.integer "medium_type"
    t.string "mediable_type"
    t.bigint "mediable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mediable_type", "mediable_id"], name: "index_media_on_mediable_type_and_mediable_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "person_type"
    t.string "name"
    t.integer "gender"
    t.string "phone"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
