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

ActiveRecord::Schema.define(version: 2019_06_07_153933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fitbit_scores", force: :cascade do |t|
    t.float "stress_score"
    t.float "exercise_score"
    t.float "diet_score"
    t.float "health_score"
    t.float "bmi", default: 0.0
    t.integer "overall_sleep", default: 0
    t.integer "awaken_sleep", default: 0
    t.integer "rem_sleep", default: 0
    t.integer "light_sleep", default: 0
    t.integer "deep_sleep", default: 0
    t.integer "heart_rate", default: 0
    t.integer "steps", default: 0
    t.integer "active_minutes", default: 0
    t.string "exercise_type"
    t.integer "exercise_time", default: 0
    t.float "exercise_km", default: 0.0
    t.integer "exercise_cal", default: 0
    t.float "water", default: 0.0
    t.float "carbs", default: 0.0
    t.float "fat", default: 0.0
    t.float "fiber", default: 0.0
    t.float "protein", default: 0.0
    t.float "sodium", default: 0.0
    t.float "sugar", default: 0.0
    t.float "cholesterol", default: 0.0
    t.float "diet_cal", default: 0.0
    t.float "alcohol_ml", default: 0.0
    t.date "logdate"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "sleep_score"
    t.float "floors", default: 0.0
    t.boolean "notified_user", default: false
    t.index ["user_id"], name: "index_fitbit_scores_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.boolean "notified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "user_params", force: :cascade do |t|
    t.float "bmi"
    t.integer "weight"
    t.integer "height"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_params_on_user_id"
  end

  create_table "user_scores", force: :cascade do |t|
    t.float "health_score"
    t.float "bmi"
    t.float "physical_activity"
    t.float "fruits_vegetables"
    t.float "whole_grains"
    t.float "red_meat"
    t.float "processed_meat"
    t.float "fats"
    t.float "soda"
    t.float "alcohol"
    t.date "logdate"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "smoker"
    t.string "fitbit_access_token"
    t.string "fitbit_refresh_token"
    t.integer "fitbit_expires_at"
    t.string "fitbit_user_id"
    t.boolean "admin", default: false, null: false
    t.date "dob"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fitbit_scores", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "user_params", "users"
  add_foreign_key "user_scores", "users"
end
