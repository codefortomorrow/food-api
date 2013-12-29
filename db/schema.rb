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

ActiveRecord::Schema.define(version: 20131207022909) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "company_no"
    t.string   "owner_name"
    t.string   "address"
    t.string   "phone_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", force: true do |t|
    t.integer  "user_id"
    t.integer  "testproject_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followships", force: true do |t|
    t.string   "user_id"
    t.integer  "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_newsships", force: true do |t|
    t.integer  "news_id"
    t.integer  "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.datetime "timestamp"
    t.string   "abstract"
    t.text     "text"
    t.string   "link"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "barcode"
    t.string   "name"
    t.integer  "company_id"
    t.string   "img_url"
    t.float    "capacity"
    t.string   "capacity_unit"
    t.float    "serving_vol"
    t.string   "serving_unit"
    t.float    "serving_size"
    t.float    "calory_kcal"
    t.float    "protein_g"
    t.float    "fat_g"
    t.float    "fat_saturated_g"
    t.float    "fat_trans_g"
    t.float    "carbohydrate_g"
    t.float    "sodium_mg"
    t.integer  "rec_score"
    t.integer  "queried_no"
    t.integer  "followed_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testprojects", force: true do |t|
    t.string   "proposer"
    t.string   "title"
    t.string   "testers"
    t.string   "test_items"
    t.integer  "product_id"
    t.text     "description"
    t.float    "target_amount"
    t.float    "current_amount"
    t.integer  "current_donators"
    t.datetime "start_date"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "account_type"
    t.string   "name"
    t.float    "balance"
    t.datetime "last_login_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
