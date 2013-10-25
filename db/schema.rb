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

ActiveRecord::Schema.define(version: 20131025064148) do

  create_table "foods", force: true do |t|
    t.string   "barcode"
    t.string   "company_name"
    t.string   "product_name"
    t.float    "capacity"
    t.string   "capacity_unit"
    t.float    "calories_kcal"
    t.float    "carbohydrate_g"
    t.float    "fat_g"
    t.float    "fat_saturated_g"
    t.float    "fat_trans_g"
    t.float    "protein_g"
    t.float    "sodium_mg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
