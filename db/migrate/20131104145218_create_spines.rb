class CreateSpines < ActiveRecord::Migration
  def change
    create_table :spines do |t|
      t.string :PATIENT_KEY
      t.string :SCANID
      t.string :SERIAL_NUMBER
      t.integer :NO_REGIONS
      t.integer :STARTING_REGION
      t.integer :L1_INCLUDED
      t.integer :L2_INCLUDED
      t.integer :L3_INCLUDED
      t.integer :L4_INCLUDED
      t.integer :L5_INCLUDED
      t.float :L1_AREA
      t.float :L1_BMC
      t.float :L1_BMD
      t.float :L2_AREA
      t.float :L2_BMC
      t.float :L2_BMD
      t.float :L3_AREA
      t.float :L3_BMC
      t.float :L3_BMD
      t.float :L4_AREA
      t.float :L4_BMC
      t.float :L4_BMD
      t.float :L5_AREA
      t.float :L5_BMC
      t.float :L5_BMD
      t.float :TOT_AREA
      t.float :TOT_BMC
      t.float :TOT_BMD
      t.float :STD_TOT_BMD
      t.integer :ROI_TYPE
      t.float :ROI_WIDTH
      t.float :ROI_HEIGHT
      t.string :PHYSICIAN_COMMENT
      t.timestamps
    end
  end
end
