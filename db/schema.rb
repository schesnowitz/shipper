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

ActiveRecord::Schema.define(version: 20160619211753) do

  create_table "abilities", force: :cascade do |t|
    t.integer "shipments_id"
    t.index ["shipments_id"], name: "index_abilities_on_shipments_id"
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "bid"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "shipments_id"
    t.integer  "user_id"
    t.index ["shipments_id"], name: "index_bids_on_shipments_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "destination_street_address"
    t.string   "destination_city"
    t.string   "destination_state_provence"
    t.string   "destination_postal_code"
    t.float    "destination_latitude"
    t.float    "destination_longitude"
    t.integer  "user_id"
    t.integer  "shipment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["shipment_id"], name: "index_destinations_on_shipment_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "rigs", force: :cascade do |t|
    t.string "equipment"
  end

  create_table "shipment_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "budget"
    t.boolean  "open_for_bids",         default: true
    t.integer  "winning_bid"
    t.string   "origin_street_address"
    t.string   "origin_city"
    t.string   "origin_state_provence"
    t.string   "origin_postal_code"
    t.float    "origin_latitude"
    t.float    "origin_longitude"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "shipment_category_id"
    t.integer  "rigs_id"
    t.integer  "user_id"
    t.index ["rigs_id"], name: "index_shipments_on_rigs_id"
    t.index ["shipment_category_id"], name: "index_shipments_on_shipment_category_id"
    t.index ["user_id"], name: "index_shipments_on_user_id"
  end

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
