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

ActiveRecord::Schema.define(version: 20160618130900) do

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
    t.index ["shipments_id"], name: "index_bids_on_shipments_id"
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
    t.string   "location"
    t.boolean  "open_for_bids",          default: true
    t.integer  "winning_bid"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "shipment_categories_id"
    t.integer  "rigs_id"
    t.index ["rigs_id"], name: "index_shipments_on_rigs_id"
    t.index ["shipment_categories_id"], name: "index_shipments_on_shipment_categories_id"
  end

end
