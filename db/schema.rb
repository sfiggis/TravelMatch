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

ActiveRecord::Schema.define(version: 20170822225035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "airport_type"
    t.float "latitude"
    t.float "longitude"
    t.float "elevation"
    t.string "continent"
    t.string "iso2"
    t.string "iso_region"
    t.string "municipality"
    t.string "scheduled_service"
    t.string "gps_code"
    t.string "iata_code"
    t.string "local_code"
    t.string "home_link"
    t.string "wikipedia_link"
    t.string "keywords"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_airports_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso2"
    t.string "iso3"
    t.string "itu"
    t.string "fips"
    t.string "currency_code"
    t.string "currency_name"
    t.string "capital"
    t.string "continent"
    t.float "gdp_ppp"
    t.string "airport_code"
    t.text "content"
  end

  create_table "search_airports", force: :cascade do |t|
    t.bigint "search_id"
    t.bigint "airport_id"
    t.index ["airport_id"], name: "index_search_airports_on_airport_id"
    t.index ["search_id"], name: "index_search_airports_on_search_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "origin"
    t.date "departure_date"
    t.date "return_date"
    t.bigint "traveller_id"
    t.integer "budget"
    t.index ["traveller_id"], name: "index_searches_on_traveller_id"
  end

  create_table "traveller_countries", force: :cascade do |t|
    t.bigint "traveller_id"
    t.bigint "country_id"
    t.boolean "home"
    t.index ["country_id"], name: "index_traveller_countries_on_country_id"
    t.index ["traveller_id"], name: "index_traveller_countries_on_traveller_id"
  end

  create_table "travellers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "currency"
    t.string "currency_code"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "home_location_id"
    t.index ["email"], name: "index_travellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_travellers_on_reset_password_token", unique: true
  end

end
