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

ActiveRecord::Schema.define(version: 20151027201016) do

  create_table "car_prospects", force: :cascade do |t|
    t.integer  "car_id"
    t.integer  "prospect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: :cascade do |t|
    t.string   "stock_id",              limit: 255
    t.string   "make",                  limit: 255
    t.string   "model",                 limit: 255
    t.string   "year",                  limit: 255
    t.string   "link",                  limit: 255
    t.string   "bitly_link",            limit: 255
    t.integer  "dealership_id"
    t.integer  "dealership_message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealership_contacts", force: :cascade do |t|
    t.string  "first_name",      limit: 255
    t.string  "last_name",       limit: 255
    t.string  "email",           limit: 255
    t.string  "phone_number",    limit: 255
    t.boolean "send_lead_text"
    t.boolean "send_lead_email"
    t.integer "dealership_id"
  end

  create_table "dealership_messages", force: :cascade do |t|
    t.string   "message_code",  limit: 255
    t.string   "message_body",  limit: 255
    t.string   "phone_number",  limit: 255
    t.integer  "message_type"
    t.integer  "dealership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealership_response_contacts", force: :cascade do |t|
    t.integer  "dealership_response_message_id"
    t.integer  "dealership_contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealership_response_messages", force: :cascade do |t|
    t.integer "dealership_message_id"
    t.integer "dealership_contact_id"
    t.string  "message_body"
  end

  create_table "dealerships", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "dealership_code", limit: 255
    t.string   "street_address",  limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "zip_code",        limit: 255
    t.string   "email",           limit: 255
    t.string   "phone_number",    limit: 255
    t.string   "twilio_number",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dealerships", ["dealership_code"], name: "index_dealerships_on_dealership_code", unique: true

  create_table "prospects", force: :cascade do |t|
    t.string   "phone_number",    limit: 255
    t.boolean  "has_been_called"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
