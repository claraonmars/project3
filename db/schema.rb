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

ActiveRecord::Schema.define(version: 2018_11_02_080049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
  end

  create_table "categories_restaurants", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "restaurant_id"
    t.index ["category_id"], name: "index_categories_restaurants_on_category_id"
    t.index ["restaurant_id"], name: "index_categories_restaurants_on_restaurant_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "menuitems", force: :cascade do |t|
    t.text "item"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 10, scale: 2
    t.index ["restaurant_id"], name: "index_menuitems_on_restaurant_id"
  end

  create_table "menuitems_reservations", force: :cascade do |t|
    t.bigint "reservation_id"
    t.bigint "menuitem_id"
    t.integer "quantity"
    t.index ["menuitem_id"], name: "index_menuitems_reservations_on_menuitem_id"
    t.index ["reservation_id"], name: "index_menuitems_reservations_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "customer_id"
    t.date "reservation_date"
    t.time "reservation_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seats"
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "userrest_id"
    t.text "image_url"
    t.string "street"
    t.string "zip"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.integer "category_id"
    t.integer "avail_seats"
    t.time "starttime"
    t.time "endtime"
    t.time "breakstart"
    t.time "breakend"
    t.text "telephone"
    t.text "opening_hours"
    t.index ["userrest_id"], name: "index_restaurants_on_userrest_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  end

  create_table "userrests", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_userrests_on_email", unique: true
    t.index ["reset_password_token"], name: "index_userrests_on_reset_password_token", unique: true
  end

  add_foreign_key "menuitems", "restaurants"
  add_foreign_key "restaurants", "userrests"
end
