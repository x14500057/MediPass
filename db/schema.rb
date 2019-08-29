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

ActiveRecord::Schema.define(version: 2019_08_28_171359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "allergy_name"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_allergies_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.string "address"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "medical_records", force: :cascade do |t|
    t.string "diagnostic"
    t.string "symptoms"
    t.string "treatment"
    t.date "date"
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_medical_records_on_doctor_id"
    t.index ["patient_id"], name: "index_medical_records_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.string "phone_number"
    t.string "address"
    t.date "datebirth"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "drug_name"
    t.string "drug_strength"
    t.string "drug_code"
    t.bigint "medical_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_record_id"], name: "index_prescriptions_on_medical_record_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "allergies", "patients"
  add_foreign_key "doctors", "users"
  add_foreign_key "medical_records", "doctors"
  add_foreign_key "medical_records", "patients"
  add_foreign_key "patients", "users"
  add_foreign_key "prescriptions", "medical_records"
end
