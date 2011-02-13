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

ActiveRecord::Schema.define(:version => 20110213204524) do

  create_table "kills", :force => true do |t|
    t.integer  "killer_id"
    t.integer  "victim_id"
    t.string   "location"
    t.string   "photo_uid"
    t.string   "attack_sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obituaries", :force => true do |t|
    t.integer  "kill_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "assassin_full_name"
    t.string   "assassin_photo_uid"
    t.string   "gender"
    t.string   "victim_photo_uid"
    t.integer  "fb_friends_count"
    t.string   "favorite_movie"
    t.string   "favorite_band"
    t.string   "favorite_book"
    t.string   "last_status_update"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
