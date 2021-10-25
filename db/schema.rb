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

ActiveRecord::Schema.define(version: 2021_10_25_083404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "title"
    t.string "meta_description"
    t.string "h1"
    t.string "h2"
    t.string "social_media_preview_image"
    t.bigint "resource_id"
    t.bigint "core_article_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["core_article_id"], name: "index_categories_on_core_article_id"
    t.index ["resource_id"], name: "index_categories_on_resource_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "company_logo"
    t.string "linkedin_url"
    t.string "funding_status"
    t.integer "founded_year"
    t.integer "company_size"
    t.string "website_link"
    t.string "company_twitter"
    t.string "business_model"
    t.integer "annual_revenue"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "core_article_id"
    t.string "slug"
    t.index ["core_article_id"], name: "index_companies_on_core_article_id"
  end

  create_table "core_articles", force: :cascade do |t|
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
    t.string "slug"
    t.string "canonical_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.bigint "company_id"
    t.index ["category_id"], name: "index_core_articles_on_category_id"
    t.index ["company_id"], name: "index_core_articles_on_company_id"
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.bigint "category_id"
    t.string "glossary_letter"
    t.index ["category_id"], name: "index_resources_on_category_id"
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

  add_foreign_key "categories", "core_articles"
  add_foreign_key "categories", "resources"
  add_foreign_key "companies", "core_articles"
  add_foreign_key "core_articles", "categories"
  add_foreign_key "core_articles", "companies"
  add_foreign_key "resources", "categories"
end
