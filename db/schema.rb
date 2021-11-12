# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_09_114133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bettings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_bettings_on_candidate_id"
    t.index ["user_id"], name: "index_bettings_on_user_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.string "title", null: false
    t.string "youtube_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "candidates_episodes", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "episode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidates_episodes_on_candidate_id"
    t.index ["episode_id"], name: "index_candidates_episodes_on_episode_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.datetime "onair_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "bettings", "candidates"
  add_foreign_key "bettings", "users"
  add_foreign_key "candidates_episodes", "candidates"
  add_foreign_key "candidates_episodes", "episodes"
end
