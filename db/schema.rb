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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20190416124854) do
=======
ActiveRecord::Schema.define(version: 20190415022756) do
>>>>>>> ONAGAX/master

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end
<<<<<<< HEAD

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_likes_on_product_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image_url",  limit: 65535, null: false
    t.integer  "product_id",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                          null: false
    t.integer  "status",                                        null: false
    t.integer  "shipping_fee",                                  null: false
    t.integer  "state",                                         null: false
    t.integer  "shipping_method",                               null: false
    t.integer  "shipping_day",                                  null: false
    t.integer  "price",                                         null: false
    t.string   "size"
    t.text     "description",     limit: 65535,                 null: false
    t.integer  "user_id",                                       null: false
    t.boolean  "sold",                          default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end
=======
>>>>>>> ONAGAX/master

  create_table "user_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                    null: false
    t.string   "last_name",                     null: false
    t.string   "kana_first_name",               null: false
    t.string   "kana_last_name",                null: false
    t.integer  "postal_code"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.integer  "tel_number"
    t.integer  "birth_year",                    null: false
    t.integer  "birth_month",                   null: false
    t.integer  "birth_day",                     null: false
    t.text     "profile_comment", limit: 65535
    t.string   "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",              null: false
    t.string   "encrypted_password", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname",           null: false
    t.index ["nickname"], name: "index_users_on_nickname", using: :btree
  end

  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "users"
end
