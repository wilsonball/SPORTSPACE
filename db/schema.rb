# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160115032149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "courts", force: :cascade do |t|
    t.string   "court_type"
    t.string   "court_floor"
    t.integer  "court_count"
    t.string   "listing_name"
    t.string   "address"
    t.text     "summary"
    t.boolean  "is_3pt"
    t.boolean  "is_ncaa3pt"
    t.boolean  "is_nba3pt"
    t.boolean  "is_centercircle"
    t.boolean  "is_key"
    t.boolean  "is_freethrowline"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "price"
    t.boolean  "is_active"
    t.string   "rim_type"
    t.string   "rim_height"
    t.string   "backboard"
    t.integer  "halfcourtcount"
    t.integer  "fullcourtcount"
    t.string   "streetaddress"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
  end

  add_index "courts", ["user_id"], name: "index_courts_on_user_id", using: :btree

  create_table "gametimes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "court_id"
    t.datetime "avail_date"
    t.datetime "start_time"
    t.datetime "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_time"
  end

  add_index "gametimes", ["court_id"], name: "index_gametimes_on_court_id", using: :btree
  add_index "gametimes", ["user_id"], name: "index_gametimes_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "court_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "photos", ["court_id"], name: "index_photos_on_court_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",       default: 1
    t.integer  "court_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "reviews", ["court_id"], name: "index_reviews_on_court_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "runs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "court_id"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "runs", ["court_id"], name: "index_runs_on_court_id", using: :btree
  add_index "runs", ["user_id"], name: "index_runs_on_user_id", using: :btree

  create_table "seengames", force: :cascade do |t|
    t.integer  "games"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "court_id"
  end

  add_index "seengames", ["court_id"], name: "index_seengames_on_court_id", using: :btree
  add_index "seengames", ["user_id"], name: "index_seengames_on_user_id", using: :btree

  create_table "seenplayers", force: :cascade do |t|
    t.integer  "players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "court_id"
  end

  add_index "seenplayers", ["court_id"], name: "index_seenplayers_on_court_id", using: :btree
  add_index "seenplayers", ["user_id"], name: "index_seenplayers_on_user_id", using: :btree

  create_table "suggestions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "suggestions", ["user_id"], name: "index_suggestions_on_user_id", using: :btree

  create_table "userphotos", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "userphotos", ["user_id"], name: "index_userphotos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "courts", "users"
  add_foreign_key "gametimes", "courts"
  add_foreign_key "gametimes", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "photos", "courts"
  add_foreign_key "reviews", "courts"
  add_foreign_key "reviews", "users"
  add_foreign_key "runs", "courts"
  add_foreign_key "runs", "users"
  add_foreign_key "seengames", "courts"
  add_foreign_key "seengames", "users"
  add_foreign_key "seenplayers", "courts"
  add_foreign_key "seenplayers", "users"
  add_foreign_key "suggestions", "users"
  add_foreign_key "userphotos", "users"
end
