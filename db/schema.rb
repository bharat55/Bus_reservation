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

ActiveRecord::Schema.define(version: 2019_08_23_100849) do

  create_table "bus_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "license_number"
    t.string "gst_number"
    t.integer "experience"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Approval Pending"
    t.index ["confirmation_token"], name: "index_bus_owners_on_confirmation_token", unique: true
    t.index ["email"], name: "index_bus_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_bus_owners_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_bus_owners_on_unlock_token", unique: true
  end

  create_table "buses", force: :cascade do |t|
    t.string "name"
    t.integer "registration_number"
    t.string "source"
    t.string "destination"
    t.integer "total_seats"
    t.integer "bus_owner_id"
    t.time "departure_time"
    t.time "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "active"
    t.string "suspended_by"
    t.index ["bus_owner_id"], name: "index_buses_on_bus_owner_id"
  end

  create_table "reservation_seats", force: :cascade do |t|
    t.integer "reservation_id"
    t.integer "seat_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reservation_seats_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "bus_id"
    t.string "reservable_type"
    t.integer "reservable_id"
    t.integer "total_seats"
    t.date "date"
    t.time "time"
    t.string "from"
    t.string "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "done"
    t.index ["bus_id"], name: "index_reservations_on_bus_id"
    t.index ["reservable_type", "reservable_id"], name: "index_reservations_on_reservable_type_and_reservable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "role", default: "customer"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
