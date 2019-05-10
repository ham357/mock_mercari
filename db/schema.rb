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

ActiveRecord::Schema.define(version: 20190510074419) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",               null: false
    t.integer  "main_category_id",   null: false
    t.integer  "sub_category_id"
    t.integer  "sub_subcategory_id"
    t.integer  "product_size_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "comment",         limit: 65535,                 null: false
    t.integer  "user_id",                                       null: false
    t.integer  "product_id",                                    null: false
    t.boolean  "comment_deleted",               default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

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

  create_table "product_shipping_fees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_product_shipping_fees_on_name", using: :btree
  end

  create_table "product_shipping_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                  null: false
    t.integer  "shipping_fee_category", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["name"], name: "index_product_shipping_methods_on_name", using: :btree
  end

  create_table "product_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            null: false
    t.integer  "product_size_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["name"], name: "index_product_sizes_on_name", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                             null: false
    t.integer  "status_id",                                        null: false
    t.integer  "shipping_fee_id",                                  null: false
    t.integer  "state_id",                                         null: false
    t.integer  "shipping_method_id",                               null: false
    t.integer  "shipping_day_id",                                  null: false
    t.integer  "price",                                            null: false
    t.text     "description",        limit: 65535,                 null: false
    t.integer  "category_id",                                      null: false
    t.integer  "brand_id"
    t.integer  "user_id",                                          null: false
    t.boolean  "sold",                             default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "product_size_id"
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "rate",       null: false
    t.integer  "user_id",    null: false
    t.integer  "rater_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider",      null: false
    t.string   "uid",           null: false
    t.string   "access_token"
    t.string   "access_secret"
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image_url",  limit: 65535
    t.integer  "user_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_user_images_on_user_id", using: :btree
  end

  create_table "user_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "first_name",                    null: false
    t.string  "last_name",                     null: false
    t.string  "kana_first_name",               null: false
    t.string  "kana_last_name",                null: false
    t.integer "postal_code"
    t.string  "state"
    t.string  "city"
    t.string  "address"
    t.integer "tel_number"
    t.integer "birth_year",                    null: false
    t.integer "birth_month",                   null: false
    t.integer "birth_day",                     null: false
    t.text    "profile_comment", limit: 65535
    t.integer "user_id",                       null: false
    t.index ["user_id"], name: "index_user_infos_on_user_id", using: :btree
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "users"
  add_foreign_key "user_images", "users"
  add_foreign_key "user_infos", "users"
end
