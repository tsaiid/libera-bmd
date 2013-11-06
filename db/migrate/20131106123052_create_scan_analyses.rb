class CreateScanAnalyses < ActiveRecord::Migration
  def change
    create_table :scan_analyses do |t|
      t.string :PATIENT_KEY
      t.string :SCANID, :null => false
      t.string :SERIAL_NUMBER, :null => false
      t.datetime :ANALYSIS_DATE
      t.string :ANAL_SERIAL_NUMBER
      t.string :REF_TYPE
      t.datetime :SCAN_DATE
      t.integer :SCAN_TYPE
      t.integer :SCAN_MODE
      t.float :WEIGHT
      t.float :HEIGHT
      t.string :COMP_SCANID
      t.string :COMP_SERIAL_NUMBER
      t.string :LINKED_SCANID
      t.string :LINKED_SERIAL_NUMBER
      t.string :SW_VERSION
      t.string :ANAL_VERSION
      t.string :HW_VERSION
      t.string :FF_VERSION
      t.string :SCAN_COMMENT
      t.string :SCAN_OPERATOR
      t.string :ANAL_OPERATOR
      t.integer :REANALYSIS_FLAG
      t.float :ACF
      t.float :BCF
      t.integer :ANALYSIS_KEY_TYPE
      t.integer :ANALYSIS_KEY_LEVEL
      t.float :K
      t.float :D0
      t.float :THICKNESS
      t.float :HI_AIR
      t.float :LO_AIR
      t.integer :PROTOCOL
      t.integer :RESULT_TYPE
      t.datetime :ALR_ARCH_DATE1
      t.datetime :ALR_ARCH_DATE2
      t.datetime :ALR_ANAL_DATE1
      t.datetime :ALR_ANAL_DATE2
      t.string :LABEL1
      t.string :LABEL2
      t.string :DIRECTORY1
      t.string :DIRECTORY2
      t.integer :STATUS
      t.string :PFILE_NAME
      t.float :POINTSIZE
      t.float :LINESIZE
      t.float :RDFLOAT
      t.string :RDTEXT
      t.datetime :LAST_UPDATE
      t.integer :EXAM_ID
      t.string :ACCESSION_NO
      t.integer :QC_SCAN
      t.float :FEMORAL_HEIGHT
      t.float :TRUE_POINTSIZE
      t.datetime :LAST_EXPORT
      t.string :HL7_1
      t.string :HL7_2
      t.string :HL7_3
      t.integer :ImagePro
      t.integer :HSA
      t.float :BMI
      t.string :WL_OTHER_PAT_IDS
      t.string :WL_STUDY_INST_UID
      t.string :WL_REQ_PROC_ID
      t.string :WL_SCHED_PROC_STEP_ID
      t.string :WL_SCHED_PROC_STEP_DESC
      t.string :WL_PERF_PROC_STEP_ID
      t.string :WL_PERF_PROC_INST_UID
      t.float :FIELD1
      t.float :FIELD2
      t.float :FIELD3
      t.float :FIELD4
      t.float :FIELD5
      t.float :FIELD6
      t.float :FIELD7
      t.float :FIELD8
      t.float :FIELD9
      t.float :FIELD10
      t.timestamps
    end
  end
end
