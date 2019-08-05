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

ActiveRecord::Schema.define(version: 2019_08_05_001248) do

  create_table "broadcast_lists", force: :cascade do |t|
    t.string "name", null: false
    t.string "event_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_code"], name: "index_broadcast_lists_on_event_code"
    t.index ["name"], name: "index_broadcast_lists_on_name", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "broadcast_list_id"
    t.string "txt"
    t.string "send_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["broadcast_list_id"], name: "index_messages_on_broadcast_list_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "phone_number"
    t.index ["phone_number"], name: "index_recipients_on_phone_number", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "broadcast_list_id"
    t.integer "recipient_id"
    t.boolean "confirmed", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["broadcast_list_id"], name: "index_subscriptions_on_broadcast_list_id"
    t.index ["recipient_id"], name: "index_subscriptions_on_recipient_id"
  end

end
