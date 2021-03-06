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

ActiveRecord::Schema.define(version: 20150823044910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "bill"
    t.integer  "quantity"
    t.decimal  "total"
    t.integer  "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bills", ["entry_id"], name: "index_bills_on_entry_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_products", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "store_id"
    t.string   "time_of_day"
  end

  create_table "expenses", force: :cascade do |t|
    t.datetime "date"
    t.boolean  "turn"
    t.string   "description"
    t.decimal  "mount"
    t.decimal  "total_general"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "store_id"
    t.integer  "provider_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "invoice_id"
    t.string   "provider_id"
    t.integer  "expense_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "invoiceable_id"
    t.string   "invoiceable_type"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "checked_out_at"
    t.decimal  "total_price"
    t.integer  "store_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "payment_status"
  end

  add_index "orders", ["checked_out_at"], name: "index_orders_on_checked_out_at", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orders_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.decimal  "total"
    t.datetime "day_of_pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.boolean  "featured"
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
    t.integer  "store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "tareas", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "provider_id"
    t.integer  "store_id"
  end

  add_foreign_key "bills", "entries"
end
