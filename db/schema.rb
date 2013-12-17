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

ActiveRecord::Schema.define(:version => 20131217215222) do

  create_table "comments", :force => true do |t|
    t.text     "body",              :null => false
    t.integer  "parent_comment_id"
    t.integer  "post_id",           :null => false
    t.integer  "user_id",           :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

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
    t.string   "post_type",          :null => false
    t.text     "title",              :null => false
    t.text     "body"
    t.string   "workout_type"
    t.decimal  "miles"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "seconds"
    t.date     "workout_date"
    t.time     "workout_time"
    t.string   "url"
    t.integer  "user_id",            :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "user_comment_likes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "comment_id", :null => false
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_comment_likes", ["comment_id"], :name => "index_user_comment_likes_on_comment_id"
  add_index "user_comment_likes", ["user_id", "comment_id"], :name => "index_user_comment_likes_on_user_id_and_comment_id", :unique => true
  add_index "user_comment_likes", ["user_id"], :name => "index_user_comment_likes_on_user_id"

  create_table "user_post_likes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "post_id",    :null => false
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_post_likes", ["post_id"], :name => "index_user_post_likes_on_post_id"
  add_index "user_post_likes", ["user_id", "post_id"], :name => "index_user_post_likes_on_user_id_and_post_id", :unique => true
  add_index "user_post_likes", ["user_id"], :name => "index_user_post_likes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",                     :null => false
    t.string   "email",                        :null => false
    t.string   "password_digest"
    t.string   "session_token"
    t.string   "password_reset_token"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

end
