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

ActiveRecord::Schema.define(version: 20150929193758) do

  create_table "car_prospects", force: true do |t|
    t.integer  "car_id"
    t.integer  "prospect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.string   "stock_id"
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "link"
    t.string   "bitly_link"
    t.integer  "dealership_id"
    t.integer  "dealership_message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealership_contacts", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "phone_number"
    t.boolean "send_lead_text"
    t.boolean "send_lead_email"
    t.integer "dealership_id"
  end

  create_table "dealership_messages", force: true do |t|
    t.string   "message_code"
    t.string   "message_body"
    t.string   "phone_number"
    t.integer  "message_type"
    t.integer  "dealership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealerships", force: true do |t|
    t.string   "name"
    t.string   "dealership_code"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "email"
    t.string   "phone_number"
    t.string   "twilio_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dealerships", ["dealership_code"], name: "index_dealerships_on_dealership_code", unique: true

  create_table "prospects", force: true do |t|
    t.string   "phone_number"
    t.boolean  "has_been_called"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
