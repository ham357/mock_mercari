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

ActiveRecord::Schema.define(version: 20190416122156) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "prefecture_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image_url",  limit: 65535, null: false
    t.integer  "product_id",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                       null: false
    t.string   "status",                                     null: false
    t.integer  "shipping_fee",                               null: false
    t.string   "state",                                      null: false
    t.integer  "shipping_day",                               null: false
    t.integer  "price",                                      null: false
    t.string   "size"
    t.text     "description",  limit: 65535,                 null: false
    t.integer  "user_id"
    t.boolean  "sold",                       default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["name"], name: "index_products_on_name", using: :btree
  end

end
