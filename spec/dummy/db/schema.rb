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

ActiveRecord::Schema.define(version: 20140625153749) do

  create_table "ottrick_otrs_queues", force: true do |t|
    t.string   "name"
    t.integer  "otrs_queue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ottrick_tickets", force: true do |t|
    t.integer  "ticketfor_id"
    t.string   "ticketfor_type"
    t.string   "sender"
    t.integer  "otrs_queue_id"
    t.string   "subject",        default: ""
    t.text     "text",           default: ""
    t.string   "ticketnumber",   default: ""
    t.integer  "otrs_ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ottrick_tickets", ["otrs_queue_id"], name: "index_ottrick_tickets_on_otrs_queue_id"
  add_index "ottrick_tickets", ["otrs_ticket_id"], name: "index_ottrick_tickets_on_otrs_ticket_id"
  add_index "ottrick_tickets", ["ticketfor_id"], name: "index_ottrick_tickets_on_ticketfor_id"

end
