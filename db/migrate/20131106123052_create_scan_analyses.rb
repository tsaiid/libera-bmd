class CreateScanAnalyses < ActiveRecord::Migration
  def change
    create_table :scan_analyses do |t|
      t.string :patient_key
      t.string :scanid, :null => false
      t.string :serial_number, :null => false
      t.datetime :analysis_date
      t.string :anal_serial_number
      t.string :ref_type
      t.datetime :scan_date
      t.integer :scan_type
      t.integer :scan_mode
      t.float :weight
      t.float :height
      t.string :comp_scanid
      t.string :comp_serial_number
      t.string :linked_scanid
      t.string :linked_serial_number
      t.string :sw_version
      t.string :anal_version
      t.string :hw_version
      t.string :ff_version
      t.string :scan_comment
      t.string :scan_operator
      t.string :anal_operator
      t.integer :reanalysis_flag
      t.float :acf
      t.float :bcf
      t.integer :analysis_key_type
      t.integer :analysis_key_level
      t.float :k
      t.float :d0
      t.float :thickness
      t.float :hi_air
      t.float :lo_air
      t.integer :protocol
      t.integer :result_type
      t.datetime :alr_arch_date1
      t.datetime :alr_arch_date2
      t.datetime :alr_anal_date1
      t.datetime :alr_anal_date2
      t.string :label1
      t.string :label2
      t.string :directory1
      t.string :directory2
      t.integer :status
      t.string :pfile_name
      t.float :pointsize
      t.float :linesize
      t.float :rdfloat
      t.string :rdtext
      t.datetime :last_update
      t.integer :exam_id
      t.string :accession_no
      t.integer :qc_scan
      t.float :femoral_height
      t.float :true_pointsize
      t.datetime :last_export
      t.string :hl7_1
      t.string :hl7_2
      t.string :hl7_3
      t.integer :imagepro
      t.integer :hsa
      t.float :bmi
      t.string :wl_other_pat_ids
      t.string :wl_study_inst_uid
      t.string :wl_req_proc_id
      t.string :wl_sched_proc_step_id
      t.string :wl_sched_proc_step_desc
      t.string :wl_perf_proc_step_id
      t.string :wl_perf_proc_inst_uid
      t.float :field1
      t.float :field2
      t.float :field3
      t.float :field4
      t.float :field5
      t.float :field6
      t.float :field7
      t.float :field8
      t.float :field9
      t.float :field10
      t.timestamps
    end
  end
end
