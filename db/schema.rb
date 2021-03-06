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

ActiveRecord::Schema.define(version: 2022_01_31_223317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "address_status", ["available", "in_use", "completed"]

  create_table "addresses", force: :cascade do |t|
    t.integer "campaign_id"
    t.string "address"
    t.string "status", default: "available", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "in_use_user_id"
    t.index ["campaign_id"], name: "index_addresses_on_campaign_id"
    t.index ["in_use_user_id"], name: "index_addresses_on_in_use_user_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name", null: false
    t.string "required_instructions", default: [], null: false, array: true
    t.string "optional_instructions", default: [], null: false, array: true
    t.text "full_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "role", default: "basic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "pending", default: true, null: false
  end

  add_foreign_key "addresses", "users", column: "in_use_user_id"
end
