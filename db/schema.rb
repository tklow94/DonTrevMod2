# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_27_190811) do

  create_table "competitors", force: :cascade do |t|
    t.string "name"
    t.boolean "is_team"
    t.integer "competitor_id"
  end

  create_table "competitors_events", id: false, force: :cascade do |t|
    t.integer "competitor_id", null: false
    t.integer "event_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "event_id"
    t.string "description"
    t.string "event_type"
    t.string "link"
    t.datetime "start_time"
    t.datetime "last_modified"
    t.integer "sport_id"
  end

  create_table "markets", force: :cascade do |t|
    t.integer "market_id"
    t.string "period"
    t.string "market_type"
  end

  create_table "outcomes", force: :cascade do |t|
    t.string "american"
    t.string "decimal"
    t.string "description"
    t.integer "market_id"
    t.integer "bovada_id"
    t.string "bovada_status"
    t.string "bovada_type"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport_name"
    t.string "sub_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "email"
  end

end
