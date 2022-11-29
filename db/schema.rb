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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_194351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "number"
    t.string "city"
    t.bigint "uf_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "address", "city", "uf_id"], name: "index_condos_on_name_and_address_and_city_and_uf_id", unique: true
    t.index ["uf_id"], name: "index_condos_on_uf_id"
    t.index ["user_id"], name: "index_condos_on_user_id"
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
<<<<<<< HEAD
=======
    t.string "user_name", default: "", null: false
    t.string "full_name", default: "", null: false
    t.boolean "admin", default: false, null: false
>>>>>>> master
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "condos", "ufs"
  add_foreign_key "condos", "users"
end
