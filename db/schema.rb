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

ActiveRecord::Schema.define(version: 20190419132729) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "kana_first_name"
    t.string  "kana_last_name"
    t.integer "postal_code"
    t.string  "state"
    t.string  "city"
    t.string  "address"
    t.integer "tel_number"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.text    "profile_comment", limit: 65535
    t.string  "user_id",                       null: false
  end

  create_table "user_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "kana_first_name"
    t.string  "kana_last_name"
    t.integer "postal_code"
    t.string  "state"
    t.string  "city"
    t.string  "address"
    t.integer "tel_number"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.text    "profile_comment", limit: 65535
    t.string  "user_id",                       null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname"
    t.string   "custmer_id"
    t.string   "card_token"
    t.string   "uid"
    t.string   "provider"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
