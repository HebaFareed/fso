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

ActiveRecord::Schema.define(version: 20150429194631) do

  create_table "applicants", force: true do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "first_name",             default: "",     null: false
    t.string   "second_name",            default: "",     null: false
    t.string   "sex",                    default: "",     null: false
    t.string   "city",                   default: "",     null: false
    t.string   "phone",                  default: "",     null: false
    t.string   "skills",                 default: "",     null: false
    t.string   "birthday",               default: "",     null: false
    t.string   "status",                 default: "خريج", null: false
    t.boolean  "paid_account",           default: false,  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "applicants", ["email"], name: "index_applicants_on_email", unique: true, using: :btree
  add_index "applicants", ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true, using: :btree

  create_table "educations", force: true do |t|
    t.text     "degree"
    t.text     "field"
    t.text     "graduation_year"
    t.text     "graduation_place"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "educations", ["applicant_id"], name: "index_educations_on_applicant_id", using: :btree

  create_table "employers", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "second_name",            default: "",    null: false
    t.string   "phone",                  default: "",    null: false
    t.string   "co_name",                default: "",    null: false
    t.string   "co_type",                default: "",    null: false
    t.string   "co_address",             default: "",    null: false
    t.string   "co_desc",                default: "",    null: false
    t.boolean  "paid_account",           default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employers", ["email"], name: "index_employers_on_email", unique: true, using: :btree
  add_index "employers", ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true, using: :btree

  create_table "experiences", force: true do |t|
    t.text     "title"
    t.text     "period"
    t.text     "company"
    t.text     "description"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["applicant_id"], name: "index_experiences_on_applicant_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "jobs", force: true do |t|
    t.text     "title"
    t.text     "experience"
    t.text     "field"
    t.text     "place"
    t.text     "description"
    t.boolean  "internship",  default: false
    t.integer  "employer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["employer_id"], name: "index_jobs_on_employer_id", using: :btree

  create_table "requests", force: true do |t|
    t.boolean  "accepted"
    t.integer  "applicant_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["applicant_id"], name: "index_requests_on_applicant_id", using: :btree
  add_index "requests", ["job_id"], name: "index_requests_on_job_id", using: :btree

  create_table "skills", force: true do |t|
    t.text     "skill"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["applicant_id"], name: "index_skills_on_applicant_id", using: :btree

end
