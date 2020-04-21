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

ActiveRecord::Schema.define(version: 2020_04_20_173237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "ltree"
  enable_extension "plpgsql"

  create_table "esrb_ratings", force: :cascade do |t|
    t.string "name", null: false
    t.string "symbol", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_esrb_ratings_on_name"
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "platform_id", null: false
    t.date "release_date", null: false
    t.bigint "publisher_id", null: false
    t.bigint "genre_id", null: false
    t.bigint "esrb_rating_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["esrb_rating_id"], name: "index_games_on_esrb_rating_id"
    t.index ["genre_id"], name: "index_games_on_genre_id"
    t.index ["platform_id"], name: "index_games_on_platform_id"
    t.index ["publisher_id"], name: "index_games_on_publisher_id"
    t.index ["release_date", "title"], name: "index_games_on_release_date_and_title"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.ltree "path", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["path"], name: "index_genres_on_path", using: :gist
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name", null: false
    t.date "release_date", null: false
    t.bigint "publisher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publisher_id"], name: "index_platforms_on_publisher_id"
    t.index ["release_date"], name: "index_platforms_on_release_date"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_publishers_on_name"
  end

  add_foreign_key "games", "esrb_ratings"
  add_foreign_key "games", "genres"
  add_foreign_key "games", "platforms"
  add_foreign_key "games", "publishers"
  add_foreign_key "platforms", "publishers"
end
