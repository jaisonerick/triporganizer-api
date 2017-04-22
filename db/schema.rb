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

ActiveRecord::Schema.define(version: 20170422132925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "trip_id"
    t.string   "type"
    t.text     "description"
    t.datetime "scheduled_at"
    t.jsonb    "details"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "company_id"
    t.datetime "end_date"
    t.index ["company_id"], name: "index_appointments_on_company_id", using: :btree
    t.index ["trip_id"], name: "index_appointments_on_trip_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.string   "phone"
    t.integer  "company_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "google_places_id"
    t.string   "picture_url"
    t.string   "site"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "google_places_id"
    t.string   "picture_url"
    t.integer  "order"
    t.integer  "trip_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "hotel_id"
    t.index ["hotel_id"], name: "index_destinations_on_hotel_id", using: :btree
    t.index ["trip_id"], name: "index_destinations_on_trip_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "destination_id"
    t.string   "name"
    t.string   "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "company_id"
    t.integer  "place_id"
    t.integer  "event_type"
    t.index ["company_id"], name: "index_events_on_company_id", using: :btree
    t.index ["destination_id"], name: "index_events_on_destination_id", using: :btree
    t.index ["place_id"], name: "index_events_on_place_id", using: :btree
  end

  create_table "flight_tickets", force: :cascade do |t|
    t.integer  "appointment_id"
    t.string   "seat"
    t.text     "details"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "registration_id"
    t.string   "confirmation_number"
    t.index ["appointment_id"], name: "index_flight_tickets_on_appointment_id", using: :btree
    t.index ["registration_id"], name: "index_flight_tickets_on_registration_id", using: :btree
  end

  create_table "hotel_reservations", force: :cascade do |t|
    t.integer  "registration_id"
    t.string   "room"
    t.text     "notes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "destination_id"
    t.integer  "appointment_id"
    t.string   "confirmation_code"
    t.index ["appointment_id"], name: "index_hotel_reservations_on_appointment_id", using: :btree
    t.index ["destination_id"], name: "index_hotel_reservations_on_destination_id", using: :btree
    t.index ["registration_id"], name: "index_hotel_reservations_on_registration_id", using: :btree
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "phone"
    t.string   "email"
    t.string   "google_places_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.integer  "appointment_id"
    t.string   "description"
    t.integer  "order"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id"], name: "index_milestones_on_appointment_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "google_places_id"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "picture_url"
    t.string   "address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.boolean  "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "insurance"
    t.index ["trip_id"], name: "index_registrations_on_trip_id", using: :btree
    t.index ["user_id"], name: "index_registrations_on_user_id", using: :btree
  end

  create_table "train_tickets", force: :cascade do |t|
    t.integer "appointment_id"
    t.integer "registration_id"
    t.text    "details"
    t.string  "ticket"
    t.index ["appointment_id"], name: "index_train_tickets_on_appointment_id", using: :btree
    t.index ["registration_id"], name: "index_train_tickets_on_registration_id", using: :btree
  end

  create_table "transits", force: :cascade do |t|
    t.integer  "registration_id"
    t.integer  "transport_id"
    t.jsonb    "specifics"
    t.string   "attachment_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["registration_id"], name: "index_transits_on_registration_id", using: :btree
    t.index ["transport_id"], name: "index_transits_on_transport_id", using: :btree
  end

  create_table "transports", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "company_id"
    t.datetime "departure_at"
    t.datetime "arrives_at"
    t.string   "origin"
    t.string   "destination"
    t.string   "attachment_url"
    t.integer  "mean"
    t.jsonb    "specifics"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["company_id"], name: "index_transports_on_company_id", using: :btree
    t.index ["trip_id"], name: "index_transports_on_trip_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "starts_at"
    t.date     "ends_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "picture_url"
    t.string   "cpf"
    t.date     "birthday"
    t.text     "address"
    t.string   "phone"
    t.string   "passport"
    t.string   "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "companies"
  add_foreign_key "appointments", "trips"
  add_foreign_key "destinations", "hotels"
  add_foreign_key "destinations", "trips"
  add_foreign_key "events", "companies"
  add_foreign_key "events", "destinations"
  add_foreign_key "events", "places"
  add_foreign_key "flight_tickets", "appointments"
  add_foreign_key "flight_tickets", "registrations"
  add_foreign_key "hotel_reservations", "destinations"
  add_foreign_key "hotel_reservations", "registrations"
  add_foreign_key "milestones", "appointments"
  add_foreign_key "registrations", "trips"
  add_foreign_key "registrations", "users"
  add_foreign_key "train_tickets", "appointments"
  add_foreign_key "train_tickets", "registrations"
  add_foreign_key "transits", "registrations"
  add_foreign_key "transits", "transports"
  add_foreign_key "transports", "companies"
  add_foreign_key "transports", "trips"
end
