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

ActiveRecord::Schema[7.0].define(version: 2022_12_01_195141) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "apartaments", force: :cascade do |t|
    t.string "ap_number"
    t.string "floor"
    t.integer "bedrooms"
    t.float "square_meters"
    t.boolean "garage"
    t.bigint "condo_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condo_id"], name: "index_apartaments_on_condo_id"
    t.index ["user_id"], name: "index_apartaments_on_user_id"
  end

  create_table "condos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "number"
    t.string "city"
    t.bigint "uf_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uf_id"], name: "index_condos_on_uf_id"
    t.index ["user_id"], name: "index_condos_on_user_id"
  end

  create_table "document_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "condo_id", null: false
    t.string "title"
    t.bigint "document_category_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condo_id"], name: "index_documents_on_condo_id"
    t.index ["document_category_id"], name: "index_documents_on_document_category_id"
  end

  create_table "note_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "condo_id", null: false
    t.string "title"
    t.date "noteDate"
    t.bigint "note_category_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condo_id"], name: "index_notes_on_condo_id"
    t.index ["note_category_id"], name: "index_notes_on_note_category_id"
  end

  create_table "ufs", force: :cascade do |t|
    t.integer "id_uf"
    t.string "sigla"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "user_name", default: "", null: false
    t.string "full_name", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apartaments", "condos"
  add_foreign_key "apartaments", "users"
  add_foreign_key "condos", "ufs"
  add_foreign_key "condos", "users"
  add_foreign_key "documents", "condos"
  add_foreign_key "documents", "document_categories"
  add_foreign_key "notes", "condos"
  add_foreign_key "notes", "note_categories"
end
