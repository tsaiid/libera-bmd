class CreateHips < ActiveRecord::Migration
  def change
    create_table :hips do |t|
      t.string :PATIENT_KEY
      t.string :SCANID, :null => false
      t.string :SERIAL_NUMBER, :null => false
      t.float :TROCH_AREA
      t.float :TROCH_BMC
      t.float :TROCH_BMD
      t.float :INTER_AREA
      t.float :INTER_BMC
      t.float :INTER_BMD
      t.float :NECK_AREA
      t.float :NECK_BMC
      t.float :NECK_BMD
      t.float :WARDS_AREA
      t.float :WARDS_BMC
      t.float :WARDS_BMD
      t.float :HTOT_AREA
      t.float :HTOT_BMC
      t.float :HTOT_BMD
      t.float :HSTD_TOT_BMD
      t.integer :ROI_TYPE
      t.float :ROI_WIDTH
      t.float :ROI_HEIGHT
      t.float :AXIS_LENGTH
      t.string :PHYSICIAN_COMMENT
      t.timestamps
    end
  end
end
