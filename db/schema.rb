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

ActiveRecord::Schema.define(version: 20150621002159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.datetime "date"
    t.boolean  "turn"
    t.decimal  "initial_value"
    t.integer  "bill"
    t.decimal  "coins"
    t.integer  "quantity"
    t.decimal  "posnet"
    t.decimal  "total_general"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.datetime "date"
    t.boolean  "turn"
    t.string   "description"
    t.decimal  "mount"
    t.decimal  "total_general"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "invoice_id"
    t.string   "provider_id"
    t.integer  "expense_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tareas", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
