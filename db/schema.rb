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

ActiveRecord::Schema.define(version: 20190414024143) do

  create_table "user_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                    null: false
    t.string   "last_name",                     null: false
    t.string   "kana_first_name",               null: false
    t.string   "kana_last_name",                null: false
    t.integer  "postal_code",                   null: false
    t.string   "state",                         null: false
    t.string   "city",                          null: false
    t.string   "adress",                        null: false
    t.integer  "tel_number"
    t.integer  "birth_year",                    null: false
    t.integer  "birth_month",                   null: false
    t.integer  "birth_day",                     null: false
    t.text     "profile_comment", limit: 65535
    t.string   "user_id",                       null: false
    t.datetime "created_at"
    t.datetime "update_at"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",              null: false
    t.string   "encrypted_password", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname",           null: false
    t.index ["nickname"], name: "index_users_on_nickname", using: :btree

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false

  end

end
