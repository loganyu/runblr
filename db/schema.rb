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

ActiveRecord::Schema.define(:version => 20131212053712) do

  create_table "follows", :force => true do |t|
    t.integer  "runner_followee_id", :null => false
    t.integer  "runner_follower_id", :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "follows", ["runner_followee_id", "runner_follower_id"], :name => "index_follows_on_runner_followee_id_and_runner_follower_id", :unique => true
  add_index "follows", ["runner_followee_id"], :name => "index_follows_on_runner_followee_id"
  add_index "follows", ["runner_follower_id"], :name => "index_follows_on_runner_follower_id"

  create_table "posts", :force => true do |t|
    t.text     "title",        :null => false
    t.text     "body"
    t.string   "workout_type", :null => false
    t.decimal  "miles"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "seconds"
    t.date     "workout_date"
    t.time     "workout_time"
    t.string   "url"
    t.integer  "user_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_post_likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
