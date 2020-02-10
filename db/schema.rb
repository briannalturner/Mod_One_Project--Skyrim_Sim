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

ActiveRecord::Schema.define(version: 2020_02_10_205249) do

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "race"
    t.integer "money"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "bounty"
    t.boolean "thanehood"
    t.integer "goodwill"
    t.boolean "home"
  end

  create_table "town", force: :cascade do |t|
    t.string "name"
    t.string "jarl"
    t.integer "quest_id"
    t.integer "interaction_id"
  end

end
