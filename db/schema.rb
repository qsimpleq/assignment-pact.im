# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_31_111356) do
  create_table "interests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_interests_on_name", unique: true
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "interest_id"
    t.integer "user_id"
    t.index ["interest_id", "user_id"], name: "index_interests_users_on_interest_id_and_user_id", unique: true
    t.index ["interest_id"], name: "index_interests_users_on_interest_id"
    t.index ["user_id"], name: "index_interests_users_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_skills_on_name", unique: true
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "skill_id"
    t.integer "user_id"
    t.index ["skill_id", "user_id"], name: "index_skills_users_on_skill_id_and_user_id", unique: true
    t.index ["skill_id"], name: "index_skills_users_on_skill_id"
    t.index ["user_id"], name: "index_skills_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.string "country"
    t.string "email", null: false
    t.string "gender"
    t.string "nationality"
    t.string "patronymic"
    t.string "surname"
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
