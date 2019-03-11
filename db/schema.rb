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

ActiveRecord::Schema.define(version: 2019_03_11_182226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_volounteers", force: :cascade do |t|
    t.integer "group_id"
    t.integer "event_id"
    t.integer "volounteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "description"
    t.integer "category_id"
    t.integer "volounteers_required"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "lng"
    t.float "lat"
  end

  create_table "group_volounteers", force: :cascade do |t|
    t.integer "volounteer_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "catagory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lng"
    t.float "lat"
    t.integer "room_id"
    t.string "neighborhood"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volounteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lng"
    t.float "lat"
    t.string "address"
    t.string "neighborhood"
  end

end
