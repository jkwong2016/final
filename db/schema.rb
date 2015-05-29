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

ActiveRecord::Schema.define(version: 0) do

  create_table "affiliations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
  end

  add_index "affiliations", ["room_id"], name: "index_affiliations_on_room_id"
  add_index "affiliations", ["user_id"], name: "index_affiliations_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.string  "title"
    t.text    "body"
    t.time    "time_since"
    t.integer "room_id"
    t.integer "reply_id"
    t.integer "vote_id"
  end

  add_index "messages", ["reply_id"], name: "index_messages_on_reply_id"
  add_index "messages", ["room_id"], name: "index_messages_on_room_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"
  add_index "messages", ["vote_id"], name: "index_messages_on_vote_id"

  create_table "replies", force: :cascade do |t|
    t.integer "user_id"
    t.text    "body"
    t.time    "time_since"
    t.integer "message_id"
    t.integer "vote_id"
  end

  add_index "replies", ["message_id"], name: "index_replies_on_message_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"
  add_index "replies", ["vote_id"], name: "index_replies_on_vote_id"

  create_table "rooms", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.integer "vote_id"
  end

  add_index "users", ["vote_id"], name: "index_users_on_vote_id"

  create_table "votes", force: :cascade do |t|
    t.integer "message_id"
    t.integer "reply_id"
    t.integer "user_id"
  end

  add_index "votes", ["message_id"], name: "index_votes_on_message_id"
  add_index "votes", ["reply_id"], name: "index_votes_on_reply_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
