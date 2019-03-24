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

ActiveRecord::Schema.define(version: 2019_03_23_231841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizers", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "protests", force: :cascade do |t|
    t.text "name"
    t.text "location"
    t.text "description"
    t.text "what_to_bring"
    t.bigint "organizer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_protests_on_organizer_id"
  end

  create_table "rsvp_people", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "phone_number"
    t.bigint "protest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["protest_id"], name: "index_rsvp_people_on_protest_id"
  end

  add_foreign_key "protests", "organizers"
  add_foreign_key "rsvp_people", "protests"
end
