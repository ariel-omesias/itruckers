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

ActiveRecord::Schema.define(version: 2021_11_17_233507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "appointment_date"
    t.string "status"
    t.bigint "user_id"
    t.bigint "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id"], name: "index_appointments_on_truck_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "image"
    t.text "description"
    t.decimal "tonnage"
    t.decimal "rate"
    t.string "region"
    t.string "commune"
    t.bigint "user_id"
    t.bigint "type_truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_truck_id"], name: "index_trucks_on_type_truck_id"
    t.index ["user_id"], name: "index_trucks_on_user_id"
  end

  create_table "type_trucks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.integer "phone"
    t.string "role"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "trucks"
  add_foreign_key "appointments", "users"
  add_foreign_key "trucks", "type_trucks"
  add_foreign_key "trucks", "users"
end
