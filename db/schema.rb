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

ActiveRecord::Schema.define(version: 20150220184546) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn"
    t.string   "publisher"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "count"
    t.integer  "library_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inventories", ["book_id"], name: "index_inventories_on_book_id"
  add_index "inventories", ["library_id"], name: "index_inventories_on_library_id"

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "count"
  end

  add_index "requests", ["book_id"], name: "index_requests_on_book_id"
  add_index "requests", ["library_id"], name: "index_requests_on_library_id"

end
