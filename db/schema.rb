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

ActiveRecord::Schema.define(version: 2022_01_28_121412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "linkedin"
    t.string "twitter"
    t.string "instagram"
    t.string "pic"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.string "cover_image"
    t.string "content_type"
    t.boolean "coming_soon", default: false
    t.bigint "author_id"
    t.date "coming_soon_date"
    t.text "table_of_contents"
    t.text "in_a_nutshell"
    t.integer "in_a_nutshell_points_count"
    t.integer "read_minutes"
    t.index ["author_id"], name: "index_core_articles_on_author_id"
    t.index ["category_id"], name: "index_core_articles_on_category_id"
    t.index ["company_id"], name: "index_core_articles_on_company_id"
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "lower(btrim((email)::text))", name: "index_subscribers_on_lower_email", unique: true
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

  create_table "startup_function_articles", force: :cascade do |t|
    t.bigint "startup_function_id", null: false
    t.bigint "core_article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["core_article_id"], name: "index_startup_function_articles_on_core_article_id"
    t.index ["startup_function_id"], name: "index_startup_function_articles_on_startup_function_id"
  end

  create_table "startup_functions", force: :cascade do |t|
    t.string "name"
    t.string "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.string "logo"
    t.string "title"
    t.text "meta_description"
    t.string "h1"
    t.string "h2"
    t.string "fa_icon"
  end

  create_table "startup_stage_articles", force: :cascade do |t|
    t.bigint "core_article_id", null: false
    t.bigint "startup_stage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["core_article_id"], name: "index_startup_stage_articles_on_core_article_id"
    t.index ["startup_stage_id"], name: "index_startup_stage_articles_on_startup_stage_id"
  end

  create_table "startup_stages", force: :cascade do |t|
    t.string "name"
    t.string "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.string "logo"
    t.string "title"
    t.text "meta_description"
    t.string "h1"
    t.string "h2"
    t.string "fa_icon"
  end

  create_table "startup_topic_articles", force: :cascade do |t|
    t.bigint "startup_topic_id", null: false
    t.bigint "core_article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["core_article_id"], name: "index_startup_topic_articles_on_core_article_id"
    t.index ["startup_topic_id"], name: "index_startup_topic_articles_on_startup_topic_id"
  end

  create_table "startup_topics", force: :cascade do |t|
    t.string "name"
    t.string "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.string "logo"
    t.string "title"
    t.text "meta_description"
    t.string "h1"
    t.string "h2"
    t.string "fa_icon"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "core_articles"
  add_foreign_key "categories", "resources"
  add_foreign_key "companies", "core_articles"
  add_foreign_key "core_articles", "authors"
  add_foreign_key "core_articles", "categories"
  add_foreign_key "core_articles", "companies"
  add_foreign_key "resources", "categories"
  add_foreign_key "startup_function_articles", "core_articles"
  add_foreign_key "startup_function_articles", "startup_functions"
  add_foreign_key "startup_stage_articles", "core_articles"
  add_foreign_key "startup_stage_articles", "startup_stages"
  add_foreign_key "startup_topic_articles", "core_articles"
  add_foreign_key "startup_topic_articles", "startup_topics"
end
