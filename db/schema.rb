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

ActiveRecord::Schema[7.1].define(version: 2024_08_02_150719) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "registered_urls", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "url", null: false
    t.boolean "active", null: false
    t.string "expires_at", null: false
    t.bigint "temporary_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "url_visits_count"
    t.bigint "user_id"
    t.index ["temporary_session_id"], name: "index_registered_urls_on_temporary_session_id"
    t.index ["user_id"], name: "index_registered_urls_on_user_id"
    t.index ["uuid"], name: "index_registered_urls_on_uuid", unique: true
  end

  create_table "temporary_sessions", force: :cascade do |t|
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_temporary_sessions_on_uuid", unique: true
  end

  create_table "url_visits", force: :cascade do |t|
    t.bigint "registered_url_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registered_url_id"], name: "index_url_visits_on_registered_url_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "jti"
    t.string "confirm_password", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "registered_urls", "temporary_sessions"
  add_foreign_key "registered_urls", "users"
  add_foreign_key "url_visits", "registered_urls"
end
