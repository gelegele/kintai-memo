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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130211013530) do

  create_table "holidays", :force => true do |t|
    t.date     "date"
    t.string   "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "monthlies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.integer  "month"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "time_records", :force => true do |t|
    t.date     "date"
    t.datetime "in"
    t.datetime "out"
    t.string   "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "monthly_id"
  end

  create_table "time_tables", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fixed_start_hours"
    t.integer  "fixed_start_minutes"
    t.integer  "fixed_end_hours"
    t.integer  "fixed_end_minutes"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "time_tables", ["user_id"], :name => "index_time_tables_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false, :null => false
  end

  create_table "working_times", :force => true do |t|
    t.integer  "start_hours"
    t.integer  "start_minutes"
    t.integer  "end_hours"
    t.integer  "end_minutes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "time_table_id"
  end

  add_index "working_times", ["time_table_id"], :name => "index_working_times_on_time_table_id"

end
