# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081019063742) do

  create_table "commits", :force => true do |t|
    t.integer  "volley_id"
    t.integer  "player_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.string   "url"
  end

  create_table "matches", :force => true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.text     "description"
    t.string   "github_user"
    t.string   "github_project"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
    t.integer  "players_count",  :default => 0, :null => false
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "match_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "fullname"
    t.string   "nickname"
    t.string   "email"
    t.string   "url"
    t.string   "identity_url"
    t.string   "github_user"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_name"
  end

  create_table "volleys", :force => true do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
