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

ActiveRecord::Schema.define(version: 20180118070736) do

  create_table "books", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "author",       limit: 255
    t.string   "code",         limit: 255
    t.decimal  "price",                    precision: 10
    t.decimal  "version",                  precision: 10
    t.integer  "no_of_copies", limit: 4
    t.integer  "library_id",   limit: 4
    t.integer  "category_id",  limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "books", ["category_id"], name: "fk_rails_1e86d9c4ec", using: :btree
  add_index "books", ["library_id"], name: "fk_rails_9bb3dacd9b", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "issued_histories", force: :cascade do |t|
    t.string   "issue_type",     limit: 255
    t.datetime "date_of_issue"
    t.datetime "date_of_return"
    t.integer  "issued_no",      limit: 4
    t.integer  "book_id",        limit: 4
    t.integer  "member_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "issued_histories", ["book_id"], name: "fk_rails_3d899172a3", using: :btree
  add_index "issued_histories", ["member_id"], name: "fk_rails_542b6e6c23", using: :btree

  create_table "libraries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "phone_no",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "phone_no",   limit: 255
    t.string   "code",       limit: 255
    t.boolean  "is_author",              default: false
    t.integer  "library_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "members", ["library_id"], name: "fk_rails_c1b1972aa6", using: :btree

  add_foreign_key "books", "categories"
  add_foreign_key "books", "libraries"
  add_foreign_key "issued_histories", "books"
  add_foreign_key "issued_histories", "members"
  add_foreign_key "members", "libraries"
end
