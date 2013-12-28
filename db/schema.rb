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

ActiveRecord::Schema.define(version: 20131228224645) do

  create_table "icpc_entries", force: true do |t|
    t.integer  "UVaID"
    t.string   "Name"
    t.text     "Description"
    t.text     "Code"
    t.integer  "UserId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "Name"
    t.string   "Description"
    t.integer  "State"
    t.integer  "UserId"
    t.integer  "TechnologyId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technologies", force: true do |t|
    t.string   "Name"
    t.integer  "ProjectID"
    t.integer  "UserId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "ShibUID"
    t.string   "ShibAffiliation"
    t.string   "ShibPrincipal"
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "EMail"
    t.string   "OpenID"
    t.string   "PersonalBio"
    t.integer  "ProjectID"
    t.integer  "ICPCEntryId"
    t.integer  "TechnologyId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
