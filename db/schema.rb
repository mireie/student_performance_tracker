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

ActiveRecord::Schema[8.0].define(version: 2024_12_02_180000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "benchmark_results", force: :cascade do |t|
    t.date "date"
    t.decimal "ge", precision: 6, scale: 2
    t.decimal "vocab_ge", precision: 6, scale: 2
    t.decimal "reading_comp_ge", precision: 6, scale: 2
    t.integer "lnf"
    t.integer "snf"
    t.integer "orf_instructional_grade_lvl"
    t.integer "orf_instructional_cwpm"
    t.decimal "orf_instructional_accuracy", precision: 8, scale: 3
    t.integer "student_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.float "sight_word_ge"
    t.float "phonemic_decoding_ge"
    t.float "elison_ge"
    t.float "blending_ge"
    t.float "isolation_ge"
    t.integer "orf_grade_lvl"
    t.integer "orf_cwpm"
    t.decimal "orf_accuracy", precision: 8, scale: 3
    t.index ["student_id"], name: "index_benchmark_results_on_student_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.date "date"
    t.float "grade"
    t.float "dibels"
    t.float "accuracy"
    t.integer "student_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["student_id"], name: "index_progresses_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "teacher_id"
    t.boolean "active", default: true
    t.integer "grade"
    t.date "cached_last_benchmark_date"
    t.date "cached_last_progress_date"
    t.index ["cached_last_benchmark_date"], name: "index_students_on_cached_last_benchmark_date"
    t.index ["cached_last_progress_date"], name: "index_students_on_cached_last_progress_date"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "active", default: true
    t.integer "students_count", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "admin", default: false
    t.boolean "active", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benchmark_results", "students"
  add_foreign_key "progresses", "students"
end
