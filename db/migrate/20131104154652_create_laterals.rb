class CreateLaterals < ActiveRecord::Migration
  def change
    create_table :laterals do |t|
      t.string :PATIENT_KEY
      t.string :SCANID, :null => false
      t.string :SERIAL_NUMBER, :null => false
      t.float :RENORM_FACTOR
      t.float :RENORM_REPORT
      t.string :BCOMP_SCANID
      t.string :BCOMP_SERIAL_NUMBER
      t.integer :NO_REGIONS
      t.integer :STARTING_REGION
      t.integer :L1_INCLUDED, :null => false
      t.integer :L2_INCLUDED, :null => false
      t.integer :L3_INCLUDED, :null => false
      t.integer :L4_INCLUDED, :null => false
      t.integer :L5_INCLUDED, :null => false
      t.float :L1_AREA
      t.float :L1_BMC
      t.float :L1_BMD
      t.float :L1_VBMD
      t.float :L1_WIDTH
      t.float :L2_AREA
      t.float :L2_BMC
      t.float :L2_BMD
      t.float :L2_VBMD
      t.float :L2_WIDTH
      t.float :L3_AREA
      t.float :L3_BMC
      t.float :L3_BMD
      t.float :L3_VBMD
      t.float :L3_WIDTH
      t.float :L4_AREA
      t.float :L4_BMC
      t.float :L4_BMD
      t.float :L4_VBMD
      t.float :L4_WIDTH
      t.float :L5_AREA
      t.float :L5_BMC
      t.float :L5_BMD
      t.float :L5_VBMD
      t.float :L5_WIDTH
      t.float :L1_MID_AREA
      t.float :L1_MID_BMC
      t.float :L1_MID_BMD
      t.float :L1_MID_VBMD
      t.float :L2_MID_AREA
      t.float :L2_MID_BMC
      t.float :L2_MID_BMD
      t.float :L2_MID_VBMD
      t.float :L3_MID_AREA
      t.float :L3_MID_BMC
      t.float :L3_MID_BMD
      t.float :L3_MID_VBMD
      t.float :L4_MID_AREA
      t.float :L4_MID_BMC
      t.float :L4_MID_BMD
      t.float :L4_MID_VBMD
      t.float :L5_MID_AREA
      t.float :L5_MID_BMC
      t.float :L5_MID_BMD
      t.float :L5_MID_VBMD
      t.float :LTOT_AREA
      t.float :LTOT_BMC
      t.float :LTOT_BMD
      t.float :LTOT_VBMD
      t.float :MIDTOT_AREA
      t.float :MIDTOT_BMC
      t.float :MIDTOT_BMD
      t.float :MIDTOT_VBMD
      t.integer :ROI_TYPE
      t.float :ROI_WIDTH
      t.float :ROI_HEIGHT
      t.float :L1_P_A_AREA
      t.float :L1_P_A_BMC
      t.float :L2_P_A_AREA
      t.float :L2_P_A_BMC
      t.float :L3_P_A_AREA
      t.float :L3_P_A_BMC
      t.float :L4_P_A_AREA
      t.float :L4_P_A_BMC
      t.float :L5_P_A_AREA
      t.float :L5_P_A_BMC
      t.float :TOTAL_P_A_AREA
      t.float :TOTAL_P_A_BMC
      t.string :PHYSICIAN_COMMENT
      t.timestamps
    end
  end
end
