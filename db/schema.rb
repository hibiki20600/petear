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

ActiveRecord::Schema.define(version: 20200224084413) do

  create_table "freriqus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "invite_id"
    t.integer  "invited_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_id", "invited_id"], name: "index_freriqus_on_invite_id_and_invited_id", unique: true, using: :btree
    t.index ["invite_id"], name: "index_freriqus_on_invite_id", using: :btree
    t.index ["invited_id"], name: "index_freriqus_on_invited_id", using: :btree
  end

  create_table "friends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friends_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_friends_on_user_id", using: :btree
  end

  create_table "goods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_goods_on_message_id", using: :btree
    t.index ["user_id", "message_id"], name: "index_goods_on_user_id_and_message_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_goods_on_user_id", using: :btree
  end

  create_table "group_followers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "group_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["follower_id"], name: "index_group_followers_on_follower_id", using: :btree
    t.index ["group_id"], name: "index_group_followers_on_group_id", using: :btree
  end

  create_table "group_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_group_users_on_user_id_and_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_group_users_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "image",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "message"
    t.string   "image"
    t.integer  "good",       default: 0
    t.integer  "bad",        default: 0
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "video"
    t.index ["group_id"], name: "index_messages_on_group_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "u_tag_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "u_tag_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_u_tag_groups_on_group_id", using: :btree
    t.index ["u_tag_id"], name: "index_u_tag_groups_on_u_tag_id", using: :btree
  end

  create_table "u_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "tag",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_u_tags_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                                        null: false
    t.string   "image",                  default: "face2.png"
    t.string   "email",                  default: "",                         null: false
    t.string   "account_id",                                                  null: false
    t.string   "encrypted_password",     default: "",                         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "comment",                default: "user has not comment yet"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "freriqus", "users", column: "invite_id"
  add_foreign_key "freriqus", "users", column: "invited_id"
  add_foreign_key "friends", "users"
  add_foreign_key "friends", "users", column: "friend_id"
  add_foreign_key "goods", "messages"
  add_foreign_key "goods", "users"
  add_foreign_key "group_followers", "groups"
  add_foreign_key "group_followers", "users", column: "follower_id"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
  add_foreign_key "u_tag_groups", "groups"
  add_foreign_key "u_tag_groups", "u_tags"
  add_foreign_key "u_tags", "users"
end
