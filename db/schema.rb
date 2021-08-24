ActiveRecord::Schema.define(version: 2021_08_24_163439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benchmarks", force: :cascade do |t|
    t.string "date"
    t.decimal "ge", precision: 6, scale: 2
    t.decimal "vocab_ge", precision: 6, scale: 2
    t.decimal "reading_comp_ge", precision: 6, scale: 2
    t.integer "lnf"
    t.integer "snf"
    t.integer "orf_grade_lvl"
    t.integer "orf_cwpm"
    t.decimal "orf_accuracy", precision: 8, scale: 3
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.date "date"
    t.float "grade"
    t.float "dibels"
    t.float "accuracy"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benchmarks", "students"
  add_foreign_key "progresses", "students"
end
