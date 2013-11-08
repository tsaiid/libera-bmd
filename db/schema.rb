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

ActiveRecord::Schema.define(version: 20131108120937) do

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

  create_table "HipHSAs", id: false, force: true do |t|
    t.string "PATIENT_KEY",      limit: 48
    t.string "SCANID",           limit: 26, null: false
    t.string "SERIAL_NUMBER",    limit: 24, null: false
    t.float  "NN_BMD"
    t.float  "NN_CSA"
    t.float  "NN_CSMI"
    t.float  "NN_WIDTH"
    t.float  "NN_ED"
    t.float  "NN_ACT"
    t.float  "NN_PCD"
    t.float  "NN_CMP"
    t.float  "NN_SECT_MOD"
    t.float  "NN_BR"
    t.float  "IT_BMD"
    t.float  "IT_CSA"
    t.float  "IT_CSMI"
    t.float  "IT_WIDTH"
    t.float  "IT_ED"
    t.float  "IT_ACT"
    t.float  "IT_PCD"
    t.float  "IT_CMP"
    t.float  "IT_SECT_MOD"
    t.float  "IT_BR"
    t.float  "FS_BMD"
    t.float  "FS_CSA"
    t.float  "FS_CSMI"
    t.float  "FS_WIDTH"
    t.float  "FS_ED"
    t.float  "FS_ACT"
    t.float  "FS_PCD"
    t.float  "FS_CMP"
    t.float  "FS_SECT_MOD"
    t.float  "FS_BR"
    t.float  "SHAFT_NECK_ANGLE"
    t.float  "VAR1"
    t.float  "VAR2"
    t.float  "VAR3"
    t.float  "VAR4"
    t.float  "VAR5"
    t.float  "VAR6"
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

  create_table "Points", id: false, force: true do |t|
    t.integer "UNIQUE_ID", null: false
    t.float   "X_VALUE",   null: false
    t.float   "Y_VALUE"
    t.float   "STD"
    t.float   "L_VALUE"
  end

  create_table "QcParams", id: false, force: true do |t|
    t.string   "PHANTOM_ID",    limit: 24, null: false
    t.integer  "PHANTOM_TYPE",             null: false
    t.integer  "SCAN_TYPE",                null: false
    t.integer  "SCAN_MODE",                null: false
    t.string   "SERIAL_NUMBER", limit: 24, null: false
    t.float    "BMD_MEAN"
    t.float    "BMD_STDEV"
    t.float    "BMD_CENTER"
    t.float    "BMD_TICK"
    t.float    "BMC_MEAN"
    t.float    "BMC_STDEV"
    t.float    "BMC_CENTER"
    t.float    "BMC_TICK"
    t.float    "AREA_MEAN"
    t.float    "AREA_STDEV"
    t.float    "AREA_CENTER"
    t.float    "AREA_TICK"
    t.float    "K_MEAN"
    t.float    "K_STDEV"
    t.float    "K_CENTER"
    t.float    "K_TICK"
    t.float    "D0_MEAN"
    t.float    "D0_STDEV"
    t.float    "D0_CENTER"
    t.float    "D0_TICK"
    t.float    "HIA_MEAN"
    t.float    "HIA_STDEV"
    t.float    "HIA_CENTER"
    t.float    "HIA_TICK"
    t.float    "LOA_MEAN"
    t.float    "LOA_STDEV"
    t.float    "LOA_CENTER"
    t.float    "LOA_TICK"
    t.float    "ACF_MEAN"
    t.float    "ACF_STDEV"
    t.float    "ACF_CENTER"
    t.float    "ACF_TICK"
    t.float    "BCF_MEAN"
    t.float    "BCF_STDEV"
    t.float    "BCF_CENTER"
    t.float    "BCF_TICK"
    t.datetime "LAST_UPDATE"
  end

  create_table "RefPhysicians", id: false, force: true do |t|
    t.string "PHY_NAME", limit: 128, null: false
  end

  create_table "ReferenceCurve", id: false, force: true do |t|
    t.integer  "UNIQUE_ID"
    t.string   "IF_CURRENT", limit: nil, null: false
    t.string   "ETHNIC",     limit: 4
    t.string   "SEX",        limit: 2
    t.string   "REFTYPE",    limit: 4
    t.string   "BONERANGE",  limit: 16
    t.string   "IF_DEFAULT", limit: nil, null: false
    t.string   "AUTHOR",     limit: 10
    t.datetime "DATE"
    t.string   "HOLOGIC",    limit: nil, null: false
    t.string   "CURVE_SET",  limit: 20
    t.string   "SOURCE",     limit: 126
    t.string   "COMMENT",    limit: 126
    t.float    "Y_MIN"
    t.float    "Y_MAX"
    t.float    "X_MIN"
    t.float    "X_MAX"
    t.float    "AGE_YOUNG"
    t.string   "X_LABEL",    limit: 126
    t.string   "Y_LABEL",    limit: 126
    t.string   "METHOD",     limit: 126
  end

  create_table "ReferenceResults", id: false, force: true do |t|
    t.string "PATIENT_KEY",   limit: 48
    t.string "SCANID",        limit: 26,  null: false
    t.string "SERIAL_NUMBER", limit: 24,  null: false
    t.string "REF_TYPE",      limit: 4,   null: false
    t.string "BONERANGE",     limit: 16,  null: false
    t.float  "T_SCORE"
    t.float  "Z_SCORE"
    t.string "TITLE",         limit: 126
    t.float  "AGE_YOUNG"
    t.float  "PCT_T"
    t.float  "PCT_Z"
  end

  create_table "SubRegionBones", id: false, force: true do |t|
    t.string  "PATIENT_KEY",       limit: 48
    t.string  "SCANID",            limit: 26,  null: false
    t.string  "SERIAL_NUMBER",     limit: 24,  null: false
    t.integer "NO_REGIONS"
    t.integer "ROI_TYPE"
    t.float   "ROI_WIDTH"
    t.float   "ROI_HEIGHT"
    t.float   "NET_AVG_AREA"
    t.float   "NET_AVG_BMC"
    t.float   "NET_AVG_BMD"
    t.float   "GLOBAL_AREA"
    t.float   "GLOBAL_BMC"
    t.float   "GLOBAL_BMD"
    t.string  "REG1_NAME",         limit: 12
    t.float   "REG1_AREA"
    t.float   "REG1_BMC"
    t.float   "REG1_BMD"
    t.string  "REG2_NAME",         limit: 12
    t.float   "REG2_AREA"
    t.float   "REG2_BMC"
    t.float   "REG2_BMD"
    t.string  "REG3_NAME",         limit: 12
    t.float   "REG3_AREA"
    t.float   "REG3_BMC"
    t.float   "REG3_BMD"
    t.string  "REG4_NAME",         limit: 12
    t.float   "REG4_AREA"
    t.float   "REG4_BMC"
    t.float   "REG4_BMD"
    t.string  "REG5_NAME",         limit: 12
    t.float   "REG5_AREA"
    t.float   "REG5_BMC"
    t.float   "REG5_BMD"
    t.string  "REG6_NAME",         limit: 12
    t.float   "REG6_AREA"
    t.float   "REG6_BMC"
    t.float   "REG6_BMD"
    t.string  "REG7_NAME",         limit: 12
    t.float   "REG7_AREA"
    t.float   "REG7_BMC"
    t.float   "REG7_BMD"
    t.string  "REG8_NAME",         limit: 12
    t.float   "REG8_AREA"
    t.float   "REG8_BMC"
    t.float   "REG8_BMD"
    t.string  "REG9_NAME",         limit: 12
    t.float   "REG9_AREA"
    t.float   "REG9_BMC"
    t.float   "REG9_BMD"
    t.string  "REG10_NAME",        limit: 12
    t.float   "REG10_AREA"
    t.float   "REG10_BMC"
    t.float   "REG10_BMD"
    t.string  "REG11_NAME",        limit: 12
    t.float   "REG11_AREA"
    t.float   "REG11_BMC"
    t.float   "REG11_BMD"
    t.string  "REG12_NAME",        limit: 12
    t.float   "REG12_AREA"
    t.float   "REG12_BMC"
    t.float   "REG12_BMD"
    t.string  "REG13_NAME",        limit: 12
    t.float   "REG13_AREA"
    t.float   "REG13_BMC"
    t.float   "REG13_BMD"
    t.string  "REG14_NAME",        limit: 12
    t.float   "REG14_AREA"
    t.float   "REG14_BMC"
    t.float   "REG14_BMD"
    t.text    "PHYSICIAN_COMMENT", limit: 255
  end

  create_table "SubRegionCompositions", id: false, force: true do |t|
    t.string  "PATIENT_KEY",            limit: 48
    t.string  "SCANID",                 limit: 26,  null: false
    t.string  "SERIAL_NUMBER",          limit: 24,  null: false
    t.string  "STEP_PHANT_ID",          limit: 128
    t.float   "FAT_STD"
    t.float   "LEAN_STD"
    t.float   "BRAIN_FAT"
    t.float   "WATER_LBM"
    t.integer "NO_REGIONS"
    t.integer "ROI_TYPE"
    t.float   "ROI_WIDTH"
    t.float   "ROI_HEIGHT"
    t.float   "NET_AVG_FAT"
    t.float   "NET_AVG_LEAN"
    t.float   "NET_AVG_MASS"
    t.float   "NET_AVG_PFAT"
    t.float   "GLOBAL_FAT"
    t.float   "GLOBAL_LEAN"
    t.float   "GLOBAL_MASS"
    t.float   "GLOBAL_PFAT"
    t.string  "REG1_NAME",              limit: 12
    t.float   "REG1_FAT"
    t.float   "REG1_LEAN"
    t.float   "REG1_MASS"
    t.float   "REG1_PFAT"
    t.string  "REG2_NAME",              limit: 12
    t.float   "REG2_FAT"
    t.float   "REG2_LEAN"
    t.float   "REG2_MASS"
    t.float   "REG2_PFAT"
    t.string  "REG3_NAME",              limit: 12
    t.float   "REG3_FAT"
    t.float   "REG3_LEAN"
    t.float   "REG3_MASS"
    t.float   "REG3_PFAT"
    t.string  "REG4_NAME",              limit: 12
    t.float   "REG4_FAT"
    t.float   "REG4_LEAN"
    t.float   "REG4_MASS"
    t.float   "REG4_PFAT"
    t.string  "REG5_NAME",              limit: 12
    t.float   "REG5_FAT"
    t.float   "REG5_LEAN"
    t.float   "REG5_MASS"
    t.float   "REG5_PFAT"
    t.string  "REG6_NAME",              limit: 12
    t.float   "REG6_FAT"
    t.float   "REG6_LEAN"
    t.float   "REG6_MASS"
    t.float   "REG6_PFAT"
    t.string  "REG7_NAME",              limit: 12
    t.float   "REG7_FAT"
    t.float   "REG7_LEAN"
    t.float   "REG7_MASS"
    t.float   "REG7_PFAT"
    t.string  "REG8_NAME",              limit: 12
    t.float   "REG8_FAT"
    t.float   "REG8_LEAN"
    t.float   "REG8_MASS"
    t.float   "REG8_PFAT"
    t.string  "REG9_NAME",              limit: 12
    t.float   "REG9_FAT"
    t.float   "REG9_LEAN"
    t.float   "REG9_MASS"
    t.float   "REG9_PFAT"
    t.string  "REG10_NAME",             limit: 12
    t.float   "REG10_FAT"
    t.float   "REG10_LEAN"
    t.float   "REG10_MASS"
    t.float   "REG10_PFAT"
    t.string  "REG11_NAME",             limit: 12
    t.float   "REG11_FAT"
    t.float   "REG11_LEAN"
    t.float   "REG11_MASS"
    t.float   "REG11_PFAT"
    t.string  "REG12_NAME",             limit: 12
    t.float   "REG12_FAT"
    t.float   "REG12_LEAN"
    t.float   "REG12_MASS"
    t.float   "REG12_PFAT"
    t.string  "REG13_NAME",             limit: 12
    t.float   "REG13_FAT"
    t.float   "REG13_LEAN"
    t.float   "REG13_MASS"
    t.float   "REG13_PFAT"
    t.string  "REG14_NAME",             limit: 12
    t.float   "REG14_FAT"
    t.float   "REG14_LEAN"
    t.float   "REG14_MASS"
    t.float   "REG14_PFAT"
    t.text    "PHYSICIAN_COMMENT",      limit: 255
    t.integer "TISSUE_ANALYSIS_METHOD"
  end

  create_table "SystemIds", id: false, force: true do |t|
    t.integer  "LastPatientNo"
    t.datetime "LastPatientDate"
    t.integer  "LastScanNo"
    t.datetime "LastScanDate"
    t.integer  "LabelSequenceNo"
    t.integer  "SaveSetSequenceNo"
    t.integer  "LastPhysicianNo"
  end

  create_table "TenYearFxRisks", id: false, force: true do |t|
    t.string   "PATIENT_KEY",     limit: 48
    t.string   "SCANID",          limit: 26, null: false
    t.string   "SERIAL_NUMBER",   limit: 24, null: false
    t.integer  "COUNTRY_CODE"
    t.float    "AGE"
    t.integer  "SEX"
    t.float    "BMI"
    t.integer  "PREV_FX"
    t.integer  "PARENT_FX"
    t.integer  "CURR_SMOKER"
    t.integer  "GLUCOCORTICOID"
    t.integer  "RH_ARTHRITIS"
    t.integer  "OSTEO2"
    t.integer  "DAILYALCOHOL"
    t.float    "L_NECK_BMD"
    t.datetime "L_HIP_SCAN_DATE"
    t.float    "R_NECK_BMD"
    t.datetime "R_HIP_SCAN_DATE"
    t.datetime "UPDATEFLAG"
    t.float    "FIELD1"
    t.float    "FIELD2"
    t.float    "VERSION"
    t.float    "I_THRESH_1"
    t.float    "I_THRESH_2"
    t.float    "HIP_FX_RISK"
    t.float    "FX_RISK"
    t.datetime "RESULTSCALCDATE"
    t.float    "FIELD3"
    t.float    "FIELD4"
  end

  create_table "Version", id: false, force: true do |t|
    t.string "Version", limit: 100
  end

  create_table "Versions", id: false, force: true do |t|
    t.string "Versions", limit: 100
  end

  create_table "Wbodies", id: false, force: true do |t|
    t.string  "PATIENT_KEY",       limit: 48
    t.string  "SCANID",            limit: 26,  null: false
    t.string  "SERIAL_NUMBER",     limit: 24,  null: false
    t.string  "STEP_PHANT_ID",     limit: 128
    t.float   "WBTOT_AREA"
    t.float   "WBTOT_BMC"
    t.float   "WBTOT_BMD"
    t.float   "SUBTOT_AREA"
    t.float   "SUBTOT_BMC"
    t.float   "SUBTOT_BMD"
    t.float   "HEAD_AREA"
    t.float   "HEAD_BMC"
    t.float   "HEAD_BMD"
    t.float   "LARM_AREA"
    t.float   "LARM_BMC"
    t.float   "LARM_BMD"
    t.float   "RARM_AREA"
    t.float   "RARM_BMC"
    t.float   "RARM_BMD"
    t.float   "LRIB_AREA"
    t.float   "LRIB_BMC"
    t.float   "LRIB_BMD"
    t.float   "RRIB_AREA"
    t.float   "RRIB_BMC"
    t.float   "RRIB_BMD"
    t.float   "T_S_AREA"
    t.float   "T_S_BMC"
    t.float   "T_S_BMD"
    t.float   "L_S_AREA"
    t.float   "L_S_BMC"
    t.float   "L_S_BMD"
    t.float   "PELV_AREA"
    t.float   "PELV_BMC"
    t.float   "PELV_BMD"
    t.float   "LLEG_AREA"
    t.float   "LLEG_BMC"
    t.float   "LLEG_BMD"
    t.float   "RLEG_AREA"
    t.float   "RLEG_BMC"
    t.float   "RLEG_BMD"
    t.integer "ROI_TYPE"
    t.float   "ROI_WIDTH"
    t.float   "ROI_HEIGHT"
    t.text    "PHYSICIAN_COMMENT", limit: 255
  end

  create_table "WbodyCompositions", id: false, force: true do |t|
    t.string  "PATIENT_KEY",            limit: 48
    t.string  "SCANID",                 limit: 26,  null: false
    t.string  "SERIAL_NUMBER",          limit: 24,  null: false
    t.string  "STEP_PHANT_ID",          limit: 128
    t.float   "FAT_STD"
    t.float   "LEAN_STD"
    t.float   "BRAIN_FAT"
    t.float   "WATER_LBM"
    t.float   "HEAD_FAT"
    t.float   "HEAD_LEAN"
    t.float   "HEAD_MASS"
    t.float   "HEAD_PFAT"
    t.float   "LARM_FAT"
    t.float   "LARM_LEAN"
    t.float   "LARM_MASS"
    t.float   "LARM_PFAT"
    t.float   "RARM_FAT"
    t.float   "RARM_LEAN"
    t.float   "RARM_MASS"
    t.float   "RARM_PFAT"
    t.float   "TRUNK_FAT"
    t.float   "TRUNK_LEAN"
    t.float   "TRUNK_MASS"
    t.float   "TRUNK_PFAT"
    t.float   "L_LEG_FAT"
    t.float   "L_LEG_LEAN"
    t.float   "L_LEG_MASS"
    t.float   "L_LEG_PFAT"
    t.float   "R_LEG_FAT"
    t.float   "R_LEG_LEAN"
    t.float   "R_LEG_MASS"
    t.float   "R_LEG_PFAT"
    t.float   "SUBTOT_FAT"
    t.float   "SUBTOT_LEAN"
    t.float   "SUBTOT_MASS"
    t.float   "SUBTOT_PFAT"
    t.float   "WBTOT_FAT"
    t.float   "WBTOT_LEAN"
    t.float   "WBTOT_MASS"
    t.float   "WBTOT_PFAT"
    t.integer "ROI_TYPE"
    t.float   "ROI_WIDTH"
    t.float   "ROI_HEIGHT"
    t.text    "PHYSICIAN_COMMENT",      limit: 255
    t.integer "TISSUE_ANALYSIS_METHOD"
  end

  create_table "hip_hsas", force: true do |t|
    t.string   "PATIENT_KEY"
    t.string   "SCANID",           null: false
    t.string   "SERIAL_NUMBER",    null: false
    t.float    "NN_BMD"
    t.float    "NN_CSA"
    t.float    "NN_CSMI"
    t.float    "NN_WIDTH"
    t.float    "NN_ED"
    t.float    "NN_ACT"
    t.float    "NN_PCD"
    t.float    "NN_CMP"
    t.float    "NN_SECT_MOD"
    t.float    "NN_BR"
    t.float    "IT_BMD"
    t.float    "IT_CSA"
    t.float    "IT_CSMI"
    t.float    "IT_WIDTH"
    t.float    "IT_ED"
    t.float    "IT_ACT"
    t.float    "IT_PCD"
    t.float    "IT_CMP"
    t.float    "IT_SECT_MOD"
    t.float    "IT_BR"
    t.float    "FS_BMD"
    t.float    "FS_CSA"
    t.float    "FS_CSMI"
    t.float    "FS_WIDTH"
    t.float    "FS_ED"
    t.float    "FS_ACT"
    t.float    "FS_PCD"
    t.float    "FS_CMP"
    t.float    "FS_SECT_MOD"
    t.float    "FS_BR"
    t.float    "SHAFT_NECK_ANGLE"
    t.float    "VAR1"
    t.float    "VAR2"
    t.float    "VAR3"
    t.float    "VAR4"
    t.float    "VAR5"
    t.float    "VAR6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hips", force: true do |t|
    t.string   "PATIENT_KEY"
    t.string   "SCANID",            null: false
    t.string   "SERIAL_NUMBER",     null: false
    t.float    "TROCH_AREA"
    t.float    "TROCH_BMC"
    t.float    "TROCH_BMD"
    t.float    "INTER_AREA"
    t.float    "INTER_BMC"
    t.float    "INTER_BMD"
    t.float    "NECK_AREA"
    t.float    "NECK_BMC"
    t.float    "NECK_BMD"
    t.float    "WARDS_AREA"
    t.float    "WARDS_BMC"
    t.float    "WARDS_BMD"
    t.float    "HTOT_AREA"
    t.float    "HTOT_BMC"
    t.float    "HTOT_BMD"
    t.float    "HSTD_TOT_BMD"
    t.integer  "ROI_TYPE"
    t.float    "ROI_WIDTH"
    t.float    "ROI_HEIGHT"
    t.float    "AXIS_LENGTH"
    t.string   "PHYSICIAN_COMMENT"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "laterals", force: true do |t|
    t.string   "PATIENT_KEY"
    t.string   "SCANID",              null: false
    t.string   "SERIAL_NUMBER",       null: false
    t.float    "RENORM_FACTOR"
    t.float    "RENORM_REPORT"
    t.string   "BCOMP_SCANID"
    t.string   "BCOMP_SERIAL_NUMBER"
    t.integer  "NO_REGIONS"
    t.integer  "STARTING_REGION"
    t.integer  "L1_INCLUDED",         null: false
    t.integer  "L2_INCLUDED",         null: false
    t.integer  "L3_INCLUDED",         null: false
    t.integer  "L4_INCLUDED",         null: false
    t.integer  "L5_INCLUDED",         null: false
    t.float    "L1_AREA"
    t.float    "L1_BMC"
    t.float    "L1_BMD"
    t.float    "L1_VBMD"
    t.float    "L1_WIDTH"
    t.float    "L2_AREA"
    t.float    "L2_BMC"
    t.float    "L2_BMD"
    t.float    "L2_VBMD"
    t.float    "L2_WIDTH"
    t.float    "L3_AREA"
    t.float    "L3_BMC"
    t.float    "L3_BMD"
    t.float    "L3_VBMD"
    t.float    "L3_WIDTH"
    t.float    "L4_AREA"
    t.float    "L4_BMC"
    t.float    "L4_BMD"
    t.float    "L4_VBMD"
    t.float    "L4_WIDTH"
    t.float    "L5_AREA"
    t.float    "L5_BMC"
    t.float    "L5_BMD"
    t.float    "L5_VBMD"
    t.float    "L5_WIDTH"
    t.float    "L1_MID_AREA"
    t.float    "L1_MID_BMC"
    t.float    "L1_MID_BMD"
    t.float    "L1_MID_VBMD"
    t.float    "L2_MID_AREA"
    t.float    "L2_MID_BMC"
    t.float    "L2_MID_BMD"
    t.float    "L2_MID_VBMD"
    t.float    "L3_MID_AREA"
    t.float    "L3_MID_BMC"
    t.float    "L3_MID_BMD"
    t.float    "L3_MID_VBMD"
    t.float    "L4_MID_AREA"
    t.float    "L4_MID_BMC"
    t.float    "L4_MID_BMD"
    t.float    "L4_MID_VBMD"
    t.float    "L5_MID_AREA"
    t.float    "L5_MID_BMC"
    t.float    "L5_MID_BMD"
    t.float    "L5_MID_VBMD"
    t.float    "LTOT_AREA"
    t.float    "LTOT_BMC"
    t.float    "LTOT_BMD"
    t.float    "LTOT_VBMD"
    t.float    "MIDTOT_AREA"
    t.float    "MIDTOT_BMC"
    t.float    "MIDTOT_BMD"
    t.float    "MIDTOT_VBMD"
    t.integer  "ROI_TYPE"
    t.float    "ROI_WIDTH"
    t.float    "ROI_HEIGHT"
    t.float    "L1_P_A_AREA"
    t.float    "L1_P_A_BMC"
    t.float    "L2_P_A_AREA"
    t.float    "L2_P_A_BMC"
    t.float    "L3_P_A_AREA"
    t.float    "L3_P_A_BMC"
    t.float    "L4_P_A_AREA"
    t.float    "L4_P_A_BMC"
    t.float    "L5_P_A_AREA"
    t.float    "L5_P_A_BMC"
    t.float    "TOTAL_P_A_AREA"
    t.float    "TOTAL_P_A_BMC"
    t.string   "PHYSICIAN_COMMENT"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_curves", force: true do |t|
    t.integer  "UNIQUE_ID"
    t.integer  "IF_CURRENT"
    t.string   "ETHNIC"
    t.string   "SEX"
    t.string   "REFTYPE"
    t.string   "BONERANGE"
    t.integer  "IF_DEFAULT"
    t.string   "AUTHOR"
    t.datetime "DATE"
    t.integer  "HOLOGIC"
    t.string   "CURVE_SET"
    t.string   "SOURCE"
    t.string   "COMMENT"
    t.float    "Y_MIN"
    t.float    "Y_MAX"
    t.float    "X_MIN"
    t.float    "X_MAX"
    t.float    "AGE_YOUNG"
    t.string   "X_LABEL"
    t.string   "Y_LABEL"
    t.string   "METHOD"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scan_analyses", force: true do |t|
    t.string   "PATIENT_KEY"
    t.string   "SCANID",                  null: false
    t.string   "SERIAL_NUMBER",           null: false
    t.datetime "ANALYSIS_DATE"
    t.string   "ANAL_SERIAL_NUMBER"
    t.string   "REF_TYPE"
    t.datetime "SCAN_DATE"
    t.integer  "SCAN_TYPE"
    t.integer  "SCAN_MODE"
    t.float    "WEIGHT"
    t.float    "HEIGHT"
    t.string   "COMP_SCANID"
    t.string   "COMP_SERIAL_NUMBER"
    t.string   "LINKED_SCANID"
    t.string   "LINKED_SERIAL_NUMBER"
    t.string   "SW_VERSION"
    t.string   "ANAL_VERSION"
    t.string   "HW_VERSION"
    t.string   "FF_VERSION"
    t.string   "SCAN_COMMENT"
    t.string   "SCAN_OPERATOR"
    t.string   "ANAL_OPERATOR"
    t.integer  "REANALYSIS_FLAG"
    t.float    "ACF"
    t.float    "BCF"
    t.integer  "ANALYSIS_KEY_TYPE"
    t.integer  "ANALYSIS_KEY_LEVEL"
    t.float    "K"
    t.float    "D0"
    t.float    "THICKNESS"
    t.float    "HI_AIR"
    t.float    "LO_AIR"
    t.integer  "PROTOCOL"
    t.integer  "RESULT_TYPE"
    t.datetime "ALR_ARCH_DATE1"
    t.datetime "ALR_ARCH_DATE2"
    t.datetime "ALR_ANAL_DATE1"
    t.datetime "ALR_ANAL_DATE2"
    t.string   "LABEL1"
    t.string   "LABEL2"
    t.string   "DIRECTORY1"
    t.string   "DIRECTORY2"
    t.integer  "STATUS"
    t.string   "PFILE_NAME"
    t.float    "POINTSIZE"
    t.float    "LINESIZE"
    t.float    "RDFLOAT"
    t.string   "RDTEXT"
    t.datetime "LAST_UPDATE"
    t.integer  "EXAM_ID"
    t.string   "ACCESSION_NO"
    t.integer  "QC_SCAN"
    t.float    "FEMORAL_HEIGHT"
    t.float    "TRUE_POINTSIZE"
    t.datetime "LAST_EXPORT"
    t.string   "HL7_1"
    t.string   "HL7_2"
    t.string   "HL7_3"
    t.integer  "ImagePro"
    t.integer  "HSA"
    t.float    "BMI"
    t.string   "WL_OTHER_PAT_IDS"
    t.string   "WL_STUDY_INST_UID"
    t.string   "WL_REQ_PROC_ID"
    t.string   "WL_SCHED_PROC_STEP_ID"
    t.string   "WL_SCHED_PROC_STEP_DESC"
    t.string   "WL_PERF_PROC_STEP_ID"
    t.string   "WL_PERF_PROC_INST_UID"
    t.float    "FIELD1"
    t.float    "FIELD2"
    t.float    "FIELD3"
    t.float    "FIELD4"
    t.float    "FIELD5"
    t.float    "FIELD6"
    t.float    "FIELD7"
    t.float    "FIELD8"
    t.float    "FIELD9"
    t.float    "FIELD10"
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
