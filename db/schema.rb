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

ActiveRecord::Schema.define(version: 20170217153256) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "note_tags", force: true do |t|
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_tags", ["description"], name: "index_note_tags_on_description", unique: true

  create_table "note_tags_notes", force: true do |t|
    t.integer "note_tag_id"
    t.integer "note_id"
  end

  add_index "note_tags_notes", ["note_id", "note_tag_id"], name: "index_note_tags_notes_on_note_id_and_note_tag_id", unique: true
  add_index "note_tags_notes", ["note_tag_id", "note_id"], name: "index_note_tags_notes_on_note_tag_id_and_note_id", unique: true

  create_table "notes", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "header",     null: false
    t.string   "text",       null: false
    t.datetime "date",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["header", "date"], name: "index_notes_on_header_and_date", unique: true

  create_table "notes_note_tags", force: true do |t|
    t.integer "note_id"
    t.integer "note_tag_id"
  end

  add_index "notes_note_tags", ["note_id", "note_tag_id"], name: "index_notes_note_tags_on_note_id_and_note_tag_id", unique: true
  add_index "notes_note_tags", ["note_tag_id", "note_id"], name: "index_notes_note_tags_on_note_tag_id_and_note_id", unique: true

  create_table "user_roles", force: true do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_roles", ["description"], name: "index_user_roles_on_description", unique: true
  add_index "user_roles", ["name"], name: "index_user_roles_on_name", unique: true

  create_table "users", force: true do |t|
    t.integer  "user_role_id", null: false
    t.string   "login",        null: false
    t.string   "password",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
