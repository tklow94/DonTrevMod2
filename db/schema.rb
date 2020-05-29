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

ActiveRecord::Schema.define(version: 2020_05_29_161213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.string "name"
    t.string "bovada_id"
    t.string "sport_name"
    t.string "sub_name"
  end

  create_table "events", force: :cascade do |t|
    t.integer "bovada_id"
    t.string "description"
    t.string "event_type"
    t.string "link"
    t.datetime "start_time"
    t.datetime "last_modified"
    t.integer "sport_id"
  end

  create_table "involvements", force: :cascade do |t|
    t.integer "competitor_id", null: false
    t.integer "event_id", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.integer "bovada_id"
    t.string "period"
    t.string "market_type"
    t.string "description"
    t.boolean "live"
    t.integer "event_id"
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

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
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

  create_table "watch_lists", force: :cascade do |t|
    t.string "kind"
    t.integer "model_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_watch_lists_on_user_id"
  end

  add_foreign_key "watch_lists", "users"
end
