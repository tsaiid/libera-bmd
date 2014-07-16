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

ActiveRecord::Schema.define(version: 20140716070311) do

  create_table "forearms", force: true do |t|
    t.string   "patient_key"
    t.string   "scanid"
    t.string   "serial_number",     null: false
    t.float    "r_13_area"
    t.float    "r_13_bmc"
    t.float    "r_13_bmd"
    t.float    "r_mid_area"
    t.float    "r_mid_bmc"
    t.float    "r_mid_bmd"
    t.float    "r_ud_area"
    t.float    "r_ud_bmc"
    t.float    "r_ud_bmd"
    t.float    "u_13_area"
    t.float    "u_13_bmc"
    t.float    "u_13_bmd"
    t.float    "u_mid_area"
    t.float    "u_mid_bmc"
    t.float    "u_mid_bmd"
    t.float    "u_ud_area"
    t.float    "u_ud_bmc"
    t.float    "u_ud_bmd"
    t.float    "rtot_area"
    t.float    "rtot_bmc"
    t.float    "rtot_bmd"
    t.float    "utot_area"
    t.float    "utot_bmc"
    t.float    "utot_bmd"
    t.float    "ru13tot_area"
    t.float    "ru13tot_bmc"
    t.float    "ru13tot_bmd"
    t.float    "rumidtot_area"
    t.float    "rumidtot_bmc"
    t.float    "rumidtot_bmd"
    t.float    "ruudtot_area"
    t.float    "ruudtot_bmc"
    t.float    "ruudtot_bmd"
    t.float    "rutot_area"
    t.float    "rutot_bmc"
    t.float    "rutot_bmd"
    t.integer  "roi_type"
    t.float    "roi_width"
    t.float    "roi_height"
    t.integer  "arm_length"
    t.string   "physician_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forearms", ["scanid"], name: "index_forearms_on_scanid", unique: true

  create_table "hip_hsas", force: true do |t|
    t.string   "patient_key"
    t.string   "scanid",           null: false
    t.string   "serial_number",    null: false
    t.float    "nn_bmd"
    t.float    "nn_csa"
    t.float    "nn_csmi"
    t.float    "nn_width"
    t.float    "nn_ed"
    t.float    "nn_act"
    t.float    "nn_pcd"
    t.float    "nn_cmp"
    t.float    "nn_sect_mod"
    t.float    "nn_br"
    t.float    "it_bmd"
    t.float    "it_csa"
    t.float    "it_csmi"
    t.float    "it_width"
    t.float    "it_ed"
    t.float    "it_act"
    t.float    "it_pcd"
    t.float    "it_cmp"
    t.float    "it_sect_mod"
    t.float    "it_br"
    t.float    "fs_bmd"
    t.float    "fs_csa"
    t.float    "fs_csmi"
    t.float    "fs_width"
    t.float    "fs_ed"
    t.float    "fs_act"
    t.float    "fs_pcd"
    t.float    "fs_cmp"
    t.float    "fs_sect_mod"
    t.float    "fs_br"
    t.float    "shaft_neck_angle"
    t.float    "var1"
    t.float    "var2"
    t.float    "var3"
    t.float    "var4"
    t.float    "var5"
    t.float    "var6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hip_hsas", ["scanid"], name: "index_hip_hsas_on_scanid", unique: true

  create_table "hips", force: true do |t|
    t.string   "patient_key"
    t.string   "scanid",            null: false
    t.string   "serial_number",     null: false
    t.float    "troch_area"
    t.float    "troch_bmc"
    t.float    "troch_bmd"
    t.float    "inter_area"
    t.float    "inter_bmc"
    t.float    "inter_bmd"
    t.float    "neck_area"
    t.float    "neck_bmc"
    t.float    "neck_bmd"
    t.float    "wards_area"
    t.float    "wards_bmc"
    t.float    "wards_bmd"
    t.float    "htot_area"
    t.float    "htot_bmc"
    t.float    "htot_bmd"
    t.float    "hstd_tot_bmd"
    t.integer  "roi_type"
    t.float    "roi_width"
    t.float    "roi_height"
    t.float    "axis_length"
    t.string   "physician_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hips", ["scanid"], name: "index_hips_on_scanid", unique: true

  create_table "laterals", force: true do |t|
    t.string   "patient_key"
    t.string   "scanid",              null: false
    t.string   "serial_number",       null: false
    t.float    "renorm_factor"
    t.float    "renorm_report"
    t.string   "bcomp_scanid"
    t.string   "bcomp_serial_number"
    t.integer  "no_regions"
    t.integer  "starting_region"
    t.integer  "l1_included",         null: false
    t.integer  "l2_included",         null: false
    t.integer  "l3_included",         null: false
    t.integer  "l4_included",         null: false
    t.integer  "l5_included",         null: false
    t.float    "l1_area"
    t.float    "l1_bmc"
    t.float    "l1_bmd"
    t.float    "l1_vbmd"
    t.float    "l1_width"
    t.float    "l2_area"
    t.float    "l2_bmc"
    t.float    "l2_bmd"
    t.float    "l2_vbmd"
    t.float    "l2_width"
    t.float    "l3_area"
    t.float    "l3_bmc"
    t.float    "l3_bmd"
    t.float    "l3_vbmd"
    t.float    "l3_width"
    t.float    "l4_area"
    t.float    "l4_bmc"
    t.float    "l4_bmd"
    t.float    "l4_vbmd"
    t.float    "l4_width"
    t.float    "l5_area"
    t.float    "l5_bmc"
    t.float    "l5_bmd"
    t.float    "l5_vbmd"
    t.float    "l5_width"
    t.float    "l1_mid_area"
    t.float    "l1_mid_bmc"
    t.float    "l1_mid_bmd"
    t.float    "l1_mid_vbmd"
    t.float    "l2_mid_area"
    t.float    "l2_mid_bmc"
    t.float    "l2_mid_bmd"
    t.float    "l2_mid_vbmd"
    t.float    "l3_mid_area"
    t.float    "l3_mid_bmc"
    t.float    "l3_mid_bmd"
    t.float    "l3_mid_vbmd"
    t.float    "l4_mid_area"
    t.float    "l4_mid_bmc"
    t.float    "l4_mid_bmd"
    t.float    "l4_mid_vbmd"
    t.float    "l5_mid_area"
    t.float    "l5_mid_bmc"
    t.float    "l5_mid_bmd"
    t.float    "l5_mid_vbmd"
    t.float    "ltot_area"
    t.float    "ltot_bmc"
    t.float    "ltot_bmd"
    t.float    "ltot_vbmd"
    t.float    "midtot_area"
    t.float    "midtot_bmc"
    t.float    "midtot_bmd"
    t.float    "midtot_vbmd"
    t.integer  "roi_type"
    t.float    "roi_width"
    t.float    "roi_height"
    t.float    "l1_p_a_area"
    t.float    "l1_p_a_bmc"
    t.float    "l2_p_a_area"
    t.float    "l2_p_a_bmc"
    t.float    "l3_p_a_area"
    t.float    "l3_p_a_bmc"
    t.float    "l4_p_a_area"
    t.float    "l4_p_a_bmc"
    t.float    "l5_p_a_area"
    t.float    "l5_p_a_bmc"
    t.float    "total_p_a_area"
    t.float    "total_p_a_bmc"
    t.string   "physician_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "laterals", ["scanid"], name: "index_laterals_on_scanid", unique: true

  create_table "patients", id: false, force: true do |t|
    t.string   "patient_key",    null: false
    t.string   "study"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "mid_initial"
    t.string   "identifier1"
    t.string   "identifier2"
    t.datetime "birthdate"
    t.string   "sex"
    t.float    "weight"
    t.float    "height"
    t.string   "ethnicity"
    t.string   "ref_physician"
    t.string   "pat_comment"
    t.integer  "menopause_year"
    t.float    "rdfloat"
    t.string   "rdtext"
    t.string   "plan"
    t.string   "group"
    t.string   "insurance"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.string   "country"
    t.string   "phantom_id"
    t.string   "phantom_type"
    t.datetime "last_update"
    t.datetime "last_export"
    t.float    "bmi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["patient_key"], name: "index_patients_on_patient_key", unique: true

  create_table "points", force: true do |t|
    t.integer  "unique_id",  null: false
    t.float    "x_value",    null: false
    t.float    "y_value"
    t.float    "std"
    t.float    "l_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qc_params", id: false, force: true do |t|
    t.string   "phantom_id",    limit: 24, null: false
    t.integer  "phantom_type",             null: false
    t.integer  "scan_type",                null: false
    t.integer  "scan_mode",                null: false
    t.string   "serial_number", limit: 24, null: false
    t.float    "bmd_mean"
    t.float    "bmd_stdev"
    t.float    "bmd_center"
    t.float    "bmd_tick"
    t.float    "bmc_mean"
    t.float    "bmc_stdev"
    t.float    "bmc_center"
    t.float    "bmc_tick"
    t.float    "area_mean"
    t.float    "area_stdev"
    t.float    "area_center"
    t.float    "area_tick"
    t.float    "k_mean"
    t.float    "k_stdev"
    t.float    "k_center"
    t.float    "k_tick"
    t.float    "d0_mean"
    t.float    "d0_stdev"
    t.float    "d0_center"
    t.float    "d0_tick"
    t.float    "hia_mean"
    t.float    "hia_stdev"
    t.float    "hia_center"
    t.float    "hia_tick"
    t.float    "loa_mean"
    t.float    "loa_stdev"
    t.float    "loa_center"
    t.float    "loa_tick"
    t.float    "acf_mean"
    t.float    "acf_stdev"
    t.float    "acf_center"
    t.float    "acf_tick"
    t.float    "bcf_mean"
    t.float    "bcf_stdev"
    t.float    "bcf_center"
    t.float    "bcf_tick"
    t.datetime "last_update"
  end

  create_table "ref_physicians", id: false, force: true do |t|
    t.string "phy_name", limit: 128, null: false
  end

  create_table "reference_curves", force: true do |t|
    t.integer  "unique_id"
    t.integer  "if_current", null: false
    t.string   "ethnic"
    t.string   "sex"
    t.string   "reftype"
    t.string   "bonerange"
    t.integer  "if_default", null: false
    t.string   "author"
    t.datetime "date"
    t.integer  "hologic",    null: false
    t.string   "curve_set"
    t.string   "source"
    t.string   "comment"
    t.float    "y_min"
    t.float    "y_max"
    t.float    "x_min"
    t.float    "x_max"
    t.float    "age_young"
    t.string   "x_label"
    t.string   "y_label"
    t.string   "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referenceresults", id: false, force: true do |t|
    t.string "patient_key",   limit: 48
    t.string "scanid",        limit: 26,  null: false
    t.string "serial_number", limit: 24,  null: false
    t.string "ref_type",      limit: 4,   null: false
    t.string "bonerange",     limit: 16,  null: false
    t.float  "t_score"
    t.float  "z_score"
    t.string "title",         limit: 126
    t.float  "age_young"
    t.float  "pct_t"
    t.float  "pct_z"
  end

  create_table "scan_analyses", force: true do |t|
    t.string   "patient_key"
    t.string   "scanid",                  null: false
    t.string   "serial_number",           null: false
    t.datetime "analysis_date"
    t.string   "anal_serial_number"
    t.string   "ref_type"
    t.datetime "scan_date"
    t.integer  "scan_type"
    t.integer  "scan_mode"
    t.float    "weight"
    t.float    "height"
    t.string   "comp_scanid"
    t.string   "comp_serial_number"
    t.string   "linked_scanid"
    t.string   "linked_serial_number"
    t.string   "sw_version"
    t.string   "anal_version"
    t.string   "hw_version"
    t.string   "ff_version"
    t.string   "scan_comment"
    t.string   "scan_operator"
    t.string   "anal_operator"
    t.integer  "reanalysis_flag"
    t.float    "acf"
    t.float    "bcf"
    t.integer  "analysis_key_type"
    t.integer  "analysis_key_level"
    t.float    "k"
    t.float    "d0"
    t.float    "thickness"
    t.float    "hi_air"
    t.float    "lo_air"
    t.integer  "protocol"
    t.integer  "result_type"
    t.datetime "alr_arch_date1"
    t.datetime "alr_arch_date2"
    t.datetime "alr_anal_date1"
    t.datetime "alr_anal_date2"
    t.string   "label1"
    t.string   "label2"
    t.string   "directory1"
    t.string   "directory2"
    t.integer  "status"
    t.string   "pfile_name"
    t.float    "pointsize"
    t.float    "linesize"
    t.float    "rdfloat"
    t.string   "rdtext"
    t.datetime "last_update"
    t.integer  "exam_id"
    t.string   "accession_no"
    t.integer  "qc_scan"
    t.float    "femoral_height"
    t.float    "true_pointsize"
    t.datetime "last_export"
    t.string   "hl7_1"
    t.string   "hl7_2"
    t.string   "hl7_3"
    t.integer  "imagepro"
    t.integer  "hsa"
    t.float    "bmi"
    t.string   "wl_other_pat_ids"
    t.string   "wl_study_inst_uid"
    t.string   "wl_req_proc_id"
    t.string   "wl_sched_proc_step_id"
    t.string   "wl_sched_proc_step_desc"
    t.string   "wl_perf_proc_step_id"
    t.string   "wl_perf_proc_inst_uid"
    t.float    "field1"
    t.float    "field2"
    t.float    "field3"
    t.float    "field4"
    t.float    "field5"
    t.float    "field6"
    t.float    "field7"
    t.float    "field8"
    t.float    "field9"
    t.float    "field10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spines", force: true do |t|
    t.string   "patient_key"
    t.string   "scanid",            null: false
    t.string   "serial_number",     null: false
    t.integer  "no_regions"
    t.integer  "starting_region"
    t.integer  "l1_included",       null: false
    t.integer  "l2_included",       null: false
    t.integer  "l3_included",       null: false
    t.integer  "l4_included",       null: false
    t.integer  "l5_included",       null: false
    t.float    "l1_area"
    t.float    "l1_bmc"
    t.float    "l1_bmd"
    t.float    "l2_area"
    t.float    "l2_bmc"
    t.float    "l2_bmd"
    t.float    "l3_area"
    t.float    "l3_bmc"
    t.float    "l3_bmd"
    t.float    "l4_area"
    t.float    "l4_bmc"
    t.float    "l4_bmd"
    t.float    "l5_area"
    t.float    "l5_bmc"
    t.float    "l5_bmd"
    t.float    "tot_area"
    t.float    "tot_bmc"
    t.float    "tot_bmd"
    t.float    "std_tot_bmd"
    t.integer  "roi_type"
    t.float    "roi_width"
    t.float    "roi_height"
    t.string   "physician_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spines", ["scanid"], name: "index_spines_on_scanid", unique: true

  create_table "sub_region_bones", id: false, force: true do |t|
    t.string  "patient_key",       limit: 48
    t.string  "scanid",            limit: 26,  null: false
    t.string  "serial_number",     limit: 24,  null: false
    t.integer "no_regions"
    t.integer "roi_type"
    t.float   "roi_width"
    t.float   "roi_height"
    t.float   "net_avg_area"
    t.float   "net_avg_bmc"
    t.float   "net_avg_bmd"
    t.float   "global_area"
    t.float   "global_bmc"
    t.float   "global_bmd"
    t.string  "reg1_name",         limit: 12
    t.float   "reg1_area"
    t.float   "reg1_bmc"
    t.float   "reg1_bmd"
    t.string  "reg2_name",         limit: 12
    t.float   "reg2_area"
    t.float   "reg2_bmc"
    t.float   "reg2_bmd"
    t.string  "reg3_name",         limit: 12
    t.float   "reg3_area"
    t.float   "reg3_bmc"
    t.float   "reg3_bmd"
    t.string  "reg4_name",         limit: 12
    t.float   "reg4_area"
    t.float   "reg4_bmc"
    t.float   "reg4_bmd"
    t.string  "reg5_name",         limit: 12
    t.float   "reg5_area"
    t.float   "reg5_bmc"
    t.float   "reg5_bmd"
    t.string  "reg6_name",         limit: 12
    t.float   "reg6_area"
    t.float   "reg6_bmc"
    t.float   "reg6_bmd"
    t.string  "reg7_name",         limit: 12
    t.float   "reg7_area"
    t.float   "reg7_bmc"
    t.float   "reg7_bmd"
    t.string  "reg8_name",         limit: 12
    t.float   "reg8_area"
    t.float   "reg8_bmc"
    t.float   "reg8_bmd"
    t.string  "reg9_name",         limit: 12
    t.float   "reg9_area"
    t.float   "reg9_bmc"
    t.float   "reg9_bmd"
    t.string  "reg10_name",        limit: 12
    t.float   "reg10_area"
    t.float   "reg10_bmc"
    t.float   "reg10_bmd"
    t.string  "reg11_name",        limit: 12
    t.float   "reg11_area"
    t.float   "reg11_bmc"
    t.float   "reg11_bmd"
    t.string  "reg12_name",        limit: 12
    t.float   "reg12_area"
    t.float   "reg12_bmc"
    t.float   "reg12_bmd"
    t.string  "reg13_name",        limit: 12
    t.float   "reg13_area"
    t.float   "reg13_bmc"
    t.float   "reg13_bmd"
    t.string  "reg14_name",        limit: 12
    t.float   "reg14_area"
    t.float   "reg14_bmc"
    t.float   "reg14_bmd"
    t.text    "physician_comment", limit: 255
  end

  create_table "sub_region_compositions", id: false, force: true do |t|
    t.string  "patient_key",            limit: 48
    t.string  "scanid",                 limit: 26,  null: false
    t.string  "serial_number",          limit: 24,  null: false
    t.string  "step_phant_id",          limit: 128
    t.float   "fat_std"
    t.float   "lean_std"
    t.float   "brain_fat"
    t.float   "water_lbm"
    t.integer "no_regions"
    t.integer "roi_type"
    t.float   "roi_width"
    t.float   "roi_height"
    t.float   "net_avg_fat"
    t.float   "net_avg_lean"
    t.float   "net_avg_mass"
    t.float   "net_avg_pfat"
    t.float   "global_fat"
    t.float   "global_lean"
    t.float   "global_mass"
    t.float   "global_pfat"
    t.string  "reg1_name",              limit: 12
    t.float   "reg1_fat"
    t.float   "reg1_lean"
    t.float   "reg1_mass"
    t.float   "reg1_pfat"
    t.string  "reg2_name",              limit: 12
    t.float   "reg2_fat"
    t.float   "reg2_lean"
    t.float   "reg2_mass"
    t.float   "reg2_pfat"
    t.string  "reg3_name",              limit: 12
    t.float   "reg3_fat"
    t.float   "reg3_lean"
    t.float   "reg3_mass"
    t.float   "reg3_pfat"
    t.string  "reg4_name",              limit: 12
    t.float   "reg4_fat"
    t.float   "reg4_lean"
    t.float   "reg4_mass"
    t.float   "reg4_pfat"
    t.string  "reg5_name",              limit: 12
    t.float   "reg5_fat"
    t.float   "reg5_lean"
    t.float   "reg5_mass"
    t.float   "reg5_pfat"
    t.string  "reg6_name",              limit: 12
    t.float   "reg6_fat"
    t.float   "reg6_lean"
    t.float   "reg6_mass"
    t.float   "reg6_pfat"
    t.string  "reg7_name",              limit: 12
    t.float   "reg7_fat"
    t.float   "reg7_lean"
    t.float   "reg7_mass"
    t.float   "reg7_pfat"
    t.string  "reg8_name",              limit: 12
    t.float   "reg8_fat"
    t.float   "reg8_lean"
    t.float   "reg8_mass"
    t.float   "reg8_pfat"
    t.string  "reg9_name",              limit: 12
    t.float   "reg9_fat"
    t.float   "reg9_lean"
    t.float   "reg9_mass"
    t.float   "reg9_pfat"
    t.string  "reg10_name",             limit: 12
    t.float   "reg10_fat"
    t.float   "reg10_lean"
    t.float   "reg10_mass"
    t.float   "reg10_pfat"
    t.string  "reg11_name",             limit: 12
    t.float   "reg11_fat"
    t.float   "reg11_lean"
    t.float   "reg11_mass"
    t.float   "reg11_pfat"
    t.string  "reg12_name",             limit: 12
    t.float   "reg12_fat"
    t.float   "reg12_lean"
    t.float   "reg12_mass"
    t.float   "reg12_pfat"
    t.string  "reg13_name",             limit: 12
    t.float   "reg13_fat"
    t.float   "reg13_lean"
    t.float   "reg13_mass"
    t.float   "reg13_pfat"
    t.string  "reg14_name",             limit: 12
    t.float   "reg14_fat"
    t.float   "reg14_lean"
    t.float   "reg14_mass"
    t.float   "reg14_pfat"
    t.text    "physician_comment",      limit: 255
    t.integer "tissue_analysis_method"
  end

  create_table "system_ids", id: false, force: true do |t|
    t.integer  "lastpatientno"
    t.datetime "lastpatientdate"
    t.integer  "lastscanno"
    t.datetime "lastscandate"
    t.integer  "labelsequenceno"
    t.integer  "savesetsequenceno"
    t.integer  "lastphysicianno"
  end

  create_table "ten_year_fx_risks", id: false, force: true do |t|
    t.string   "patient_key",     limit: 48
    t.string   "scanid",          limit: 26, null: false
    t.string   "serial_number",   limit: 24, null: false
    t.integer  "country_code"
    t.float    "age"
    t.integer  "sex"
    t.float    "bmi"
    t.integer  "prev_fx"
    t.integer  "parent_fx"
    t.integer  "curr_smoker"
    t.integer  "glucocorticoid"
    t.integer  "rh_arthritis"
    t.integer  "osteo2"
    t.integer  "dailyalcohol"
    t.float    "l_neck_bmd"
    t.datetime "l_hip_scan_date"
    t.float    "r_neck_bmd"
    t.datetime "r_hip_scan_date"
    t.datetime "updateflag"
    t.float    "field1"
    t.float    "field2"
    t.float    "version"
    t.float    "i_thresh_1"
    t.float    "i_thresh_2"
    t.float    "hip_fx_risk"
    t.float    "fx_risk"
    t.datetime "resultscalcdate"
    t.float    "field3"
    t.float    "field4"
  end

  create_table "version", id: false, force: true do |t|
    t.string "version", limit: 100
  end

  create_table "versions", id: false, force: true do |t|
    t.string "versions", limit: 100
  end

  create_table "w_bodies", force: true do |t|
    t.string   "patient_key"
    t.string   "scanid",            null: false
    t.string   "serial_number",     null: false
    t.string   "step_phant_id"
    t.float    "wbtot_area"
    t.float    "wbtot_bmc"
    t.float    "wbtot_bmd"
    t.float    "subtot_area"
    t.float    "subtot_bmc"
    t.float    "subtot_bmd"
    t.float    "head_area"
    t.float    "head_bmc"
    t.float    "head_bmd"
    t.float    "larm_area"
    t.float    "larm_bmc"
    t.float    "larm_bmd"
    t.float    "rarm_area"
    t.float    "rarm_bmc"
    t.float    "rarm_bmd"
    t.float    "lrib_area"
    t.float    "lrib_bmc"
    t.float    "lrib_bmd"
    t.float    "rrib_area"
    t.float    "rrib_bmc"
    t.float    "rrib_bmd"
    t.float    "t_s_area"
    t.float    "t_s_bmc"
    t.float    "t_s_bmd"
    t.float    "l_s_area"
    t.float    "l_s_bmc"
    t.float    "l_s_bmd"
    t.float    "pelv_area"
    t.float    "pelv_bmc"
    t.float    "pelv_bmd"
    t.float    "lleg_area"
    t.float    "lleg_bmc"
    t.float    "lleg_bmd"
    t.float    "rleg_area"
    t.float    "rleg_bmc"
    t.float    "rleg_bmd"
    t.integer  "roi_type"
    t.float    "roi_width"
    t.float    "roi_height"
    t.string   "physician_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "w_bodies", ["scanid"], name: "index_w_bodies_on_scanid", unique: true

  create_table "w_body_compositions", id: false, force: true do |t|
    t.string  "patient_key",            limit: 48
    t.string  "scanid",                 limit: 26,  null: false
    t.string  "serial_number",          limit: 24,  null: false
    t.string  "step_phant_id",          limit: 128
    t.float   "fat_std"
    t.float   "lean_std"
    t.float   "brain_fat"
    t.float   "water_lbm"
    t.float   "head_fat"
    t.float   "head_lean"
    t.float   "head_mass"
    t.float   "head_pfat"
    t.float   "larm_fat"
    t.float   "larm_lean"
    t.float   "larm_mass"
    t.float   "larm_pfat"
    t.float   "rarm_fat"
    t.float   "rarm_lean"
    t.float   "rarm_mass"
    t.float   "rarm_pfat"
    t.float   "trunk_fat"
    t.float   "trunk_lean"
    t.float   "trunk_mass"
    t.float   "trunk_pfat"
    t.float   "l_leg_fat"
    t.float   "l_leg_lean"
    t.float   "l_leg_mass"
    t.float   "l_leg_pfat"
    t.float   "r_leg_fat"
    t.float   "r_leg_lean"
    t.float   "r_leg_mass"
    t.float   "r_leg_pfat"
    t.float   "subtot_fat"
    t.float   "subtot_lean"
    t.float   "subtot_mass"
    t.float   "subtot_pfat"
    t.float   "wbtot_fat"
    t.float   "wbtot_lean"
    t.float   "wbtot_mass"
    t.float   "wbtot_pfat"
    t.integer "roi_type"
    t.float   "roi_width"
    t.float   "roi_height"
    t.text    "physician_comment",      limit: 255
    t.integer "tissue_analysis_method"
  end

end
