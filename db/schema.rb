# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180311224832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boat_classes", force: :cascade do |t|
    t.string   "class_name"
    t.float    "registration_fee"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_boat_classes_on_deleted_at", using: :btree
  end

  create_table "galleries", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "published_on"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["author_id"], name: "index_news_on_author_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.text     "photographer"
    t.text     "caption"
    t.integer  "gallery_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["gallery_id"], name: "index_photos_on_gallery_id", using: :btree
  end

  create_table "race_registrations", force: :cascade do |t|
    t.integer  "paid",                      default: 0
    t.text     "boat_number"
    t.text     "boat_owner"
    t.text     "boat_owner_zip"
    t.text     "boat_name"
    t.text     "emergency_contact"
    t.text     "emergency_phone"
    t.boolean  "emergency_contact_at_race"
    t.integer  "race_id"
    t.integer  "boat_class_id"
    t.integer  "usts_registration_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "transaction_number"
    t.datetime "payment_date"
    t.datetime "deleted_at"
    t.text     "payer_email"
    t.text     "payer_id"
    t.index ["boat_class_id"], name: "index_race_registrations_on_boat_class_id", using: :btree
    t.index ["creator_id"], name: "index_race_registrations_on_creator_id", using: :btree
    t.index ["deleted_at"], name: "index_race_registrations_on_deleted_at", using: :btree
    t.index ["race_id"], name: "index_race_registrations_on_race_id", using: :btree
    t.index ["usts_registration_id"], name: "index_race_registrations_on_usts_registration_id", using: :btree
  end

  create_table "race_results", force: :cascade do |t|
    t.text     "driver_name"
    t.float    "points"
    t.integer  "boat_class_id"
    t.integer  "race_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "usts_number"
    t.index ["boat_class_id"], name: "index_race_results_on_boat_class_id", using: :btree
    t.index ["race_id"], name: "index_race_results_on_race_id", using: :btree
  end

  create_table "races", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.float    "fee_override"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "details"
    t.text     "hotel_information"
    t.text     "title"
    t.string   "sanction_file_name"
    t.string   "sanction_content_type"
    t.integer  "sanction_file_size"
    t.datetime "sanction_updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_races_on_deleted_at", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.text     "name"
    t.text     "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.string   "email",                  default: "",    null: false
    t.boolean  "driver",                 default: false
    t.integer  "role",                   default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "usts_registrations", force: :cascade do |t|
    t.integer  "race_year"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "usts_number"
    t.text     "street_address"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.text     "email"
    t.text     "phone"
    t.text     "fax"
    t.datetime "birthdate"
    t.boolean  "liability_release"
    t.integer  "membership_type"
    t.text     "signature"
    t.integer  "creator_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "paid",               default: 0
    t.text     "transaction_number"
    t.datetime "payment_date"
    t.datetime "deleted_at"
    t.text     "payer_email"
    t.text     "payer_id"
    t.index ["creator_id"], name: "index_usts_registrations_on_creator_id", using: :btree
    t.index ["deleted_at"], name: "index_usts_registrations_on_deleted_at", using: :btree
  end

  add_foreign_key "news", "users", column: "author_id"
  add_foreign_key "photos", "galleries"
  add_foreign_key "race_registrations", "boat_classes"
  add_foreign_key "race_registrations", "races"
  add_foreign_key "race_registrations", "users", column: "creator_id"
  add_foreign_key "race_registrations", "usts_registrations"
  add_foreign_key "race_results", "boat_classes"
  add_foreign_key "race_results", "races"
  add_foreign_key "usts_registrations", "users", column: "creator_id"
end
