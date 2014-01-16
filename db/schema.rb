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

ActiveRecord::Schema.define(version: 20140112214410) do

  create_table "competencies", force: true do |t|
    t.integer  "user_id"
    t.integer  "technology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "icpc_entries", force: true do |t|
    t.integer  "uva_id"
    t.string   "name"
    t.text     "description"
    t.text     "code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "state"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_technologies", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "technology_id"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "technologies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technologies_users", id: false, force: true do |t|
    t.integer "technology_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "shib_uid"
    t.string   "shib_affiliation"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "open_id"
    t.text     "personal_bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "shib_eppn"
    t.string   "shib_samaccountname"
    t.string   "shib_credid"
  end

end
