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

ActiveRecord::Schema.define(:version => 20110223071444) do

  create_table "ping_pongs", :force => true do |t|
    t.string   "ping"
    t.string   "pong"
    t.string   "mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "serve_id"
  end

  add_index "ping_pongs", ["mode"], :name => "index_ping_pongs_on_mode"
  add_index "ping_pongs", ["ping"], :name => "index_ping_pongs_on_ping"
  add_index "ping_pongs", ["pong"], :name => "index_ping_pongs_on_pong"
  add_index "ping_pongs", ["serve_id"], :name => "index_ping_pongs_on_serve_id"

  create_table "pronunciations", :force => true do |t|
    t.string   "word"
    t.string   "transcription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pronunciations", ["transcription"], :name => "index_pronunciations_on_transcription"
  add_index "pronunciations", ["word"], :name => "index_pronunciations_on_word"

end
