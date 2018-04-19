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

ActiveRecord::Schema.define(version: 20170405122320) do

  create_table "bills", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "salesmenu_id"
    t.integer  "workperiod_id"
    t.integer  "totalprice",    default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "store_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pincodes", force: :cascade do |t|
    t.integer  "pincode"
    t.boolean  "used",       default: false
    t.integer  "storeid"
    t.string   "major"
    t.string   "memo"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "salesmenus", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "qty",        default: 1
    t.integer  "bill_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "incometoday",  default: 0
    t.integer  "incomeall",    default: 0
    t.boolean  "working",      default: false
    t.boolean  "billopen",     default: false
    t.string   "major"
    t.boolean  "confirmation", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "phone_number"
    t.boolean  "admin_check",            default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workperiods", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "startmoney"
    t.string   "startingtime"
    t.string   "finishtime"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
