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

ActiveRecord::Schema.define(version: 2020_05_18_075128) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "documents", force: :cascade do |t|
    t.string "_id"
    t.date "date"
    t.integer "downloaded"
    t.text "overview"
    t.text "path"
    t.string "tags"
    t.text "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents_infocomplains", id: false, force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "infocomplain_id", null: false
  end

  create_table "documents_inforequests", id: false, force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "inforequest_id", null: false
  end

  create_table "icresults", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "infocomplains", force: :cascade do |t|
    t.string "_id"
    t.string "case_id"
    t.integer "institution_id"
    t.text "comment"
    t.date "date"
    t.text "detail"
    t.date "finish"
    t.string "office"
    t.string "office_id"
    t.text "overview"
    t.integer "ref"
    t.string "_result"
    t.string "reviewer"
    t.integer "reviewer_id"
    t.date "start"
    t.string "_status"
    t.integer "status_id"
    t.integer "icresult_id"
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inforequests", force: :cascade do |t|
    t.string "_id"
    t.string "case_id"
    t.integer "institution_id"
    t.text "comment"
    t.date "date"
    t.text "detail"
    t.date "finish"
    t.string "office"
    t.string "office_id"
    t.text "overview"
    t.integer "ref"
    t.string "_result"
    t.date "start"
    t.string "_status"
    t.integer "status_id"
    t.integer "result_id"
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "office_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "results", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "updates", force: :cascade do |t|
    t.integer "inforequest_id"
    t.integer "infocomplain_id"
    t.date "date"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
