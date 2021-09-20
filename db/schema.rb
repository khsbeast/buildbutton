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

ActiveRecord::Schema.define(version: 2021_09_20_125941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.string "meta_description"
    t.string "h1"
    t.string "h2"
    t.text "content"
    t.string "index_title"
    t.date "index_date"
    t.text "top_articles"
    t.text "top_articles_urls"
    t.text "related_articles"
    t.text "related_articles_urls"
    t.boolean "sticky_sidebar"
    t.string "social_media_preview_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.string "canonical_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
