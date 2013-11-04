# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131104145218) do

  create_table "Forearms", force: true do |t|
    t.string   "PATIENT_KEY"
    t.string   "SCANID"
    t.string   "SERIAL_NUMBER",     null: false
    t.float    "R_13_AREA"
    t.float    "R_13_BMC"
    t.float    "R_13_BMD"
    t.float    "R_MID_AREA"
    t.float    "R_MID_BMC"
    t.float    "R_MID_BMD"
    t.float    "R_UD_AREA"
    t.float    "R_UD_BMC"
    t.float    "R_UD_BMD"
    t.float    "U_13_AREA"
    t.float    "U_13_BMC"
    t.float    "U_13_BMD"
    t.float    "U_MID_AREA"
    t.float    "U_MID_BMC"
    t.float    "U_MID_BMD"
    t.float    "U_UD_AREA"
    t.float    "U_UD_BMC"
    t.float    "U_UD_BMD"
    t.float    "RTOT_AREA"
    t.float    "RTOT_BMC"
    t.float    "RTOT_BMD"
    t.float    "UTOT_AREA"
    t.float    "UTOT_BMC"
    t.float    "UTOT_BMD"
    t.float    "RU13TOT_AREA"
    t.float    "RU13TOT_BMC"
    t.float    "RU13TOT_BMD"
    t.float    "RUMIDTOT_AREA"
    t.float    "RUMIDTOT_BMC"
    t.float    "RUMIDTOT_BMD"
    t.float    "RUUDTOT_AREA"
    t.float    "RUUDTOT_BMC"
    t.float    "RUUDTOT_BMD"
    t.float    "RUTOT_AREA"
    t.float    "RUTOT_BMC"
    t.float    "RUTOT_BMD"
    t.integer  "ROI_TYPE"
    t.float    "ROI_WIDTH"
    t.float    "ROI_HEIGHT"
    t.integer  "ARM_LENGTH"
    t.string   "PHYSICIAN_COMMENT"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "PATIENTS", id: false, force: true do |t|
    t.string   "PATIENT_KEY",    null: false
    t.string   "STUDY"
    t.string   "LAST_NAME"
    t.string   "FIRST_NAME"
    t.string   "MID_INITIAL"
    t.string   "IDENTIFIER1"
    t.string   "IDENTIFIER2"
    t.datetime "BIRTHDATE"
    t.string   "SEX"
    t.float    "WEIGHT"
    t.float    "HEIGHT"
    t.string   "ETHNICITY"
    t.string   "REF_PHYSICIAN"
    t.string   "PAT_COMMENT"
    t.integer  "MENOPAUSE_YEAR"
    t.float    "RDFLOAT"
    t.string   "RDTEXT"
    t.string   "PLAN"
    t.string   "GROUP"
    t.string   "INSURANCE"
    t.string   "ADDRESS1"
    t.string   "ADDRESS2"
    t.string   "CITY"
    t.string   "STATE"
    t.string   "POSTAL"
    t.string   "COUNTRY"
    t.string   "PHANTOM_ID"
    t.string   "PHANTOM_TYPE"
    t.datetime "LAST_UPDATE"
    t.datetime "LAST_EXPORT"
    t.float    "BMI"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spines", force: true do |t|
    t.string   "PATIENT_KEY"
    t.string   "SCANID",            null: false
    t.string   "SERIAL_NUMBER",     null: false
    t.integer  "NO_REGIONS"
    t.integer  "STARTING_REGION"
    t.integer  "L1_INCLUDED",       null: false
    t.integer  "L2_INCLUDED",       null: false
    t.integer  "L3_INCLUDED",       null: false
    t.integer  "L4_INCLUDED",       null: false
    t.integer  "L5_INCLUDED",       null: false
    t.float    "L1_AREA"
    t.float    "L1_BMC"
    t.float    "L1_BMD"
    t.float    "L2_AREA"
    t.float    "L2_BMC"
    t.float    "L2_BMD"
    t.float    "L3_AREA"
    t.float    "L3_BMC"
    t.float    "L3_BMD"
    t.float    "L4_AREA"
    t.float    "L4_BMC"
    t.float    "L4_BMD"
    t.float    "L5_AREA"
    t.float    "L5_BMC"
    t.float    "L5_BMD"
    t.float    "TOT_AREA"
    t.float    "TOT_BMC"
    t.float    "TOT_BMD"
    t.float    "STD_TOT_BMD"
    t.integer  "ROI_TYPE"
    t.float    "ROI_WIDTH"
    t.float    "ROI_HEIGHT"
    t.string   "PHYSICIAN_COMMENT"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
