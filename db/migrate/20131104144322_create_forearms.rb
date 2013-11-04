class CreateForearms < ActiveRecord::Migration
  def change
    create_table :Forearms do |t|
      t.string :PATIENT_KEY 
      t.string :SCANID
      t.string :SERIAL_NUMBER
      t.float :R_13_AREA
      t.float :R_13_BMC
      t.float :R_13_BMD
      t.float :R_MID_AREA
      t.float :R_MID_BMC
      t.float :R_MID_BMD
      t.float :R_UD_AREA
      t.float :R_UD_BMC
      t.float :R_UD_BMD
      t.float :U_13_AREA
      t.float :U_13_BMC
      t.float :U_13_BMD
      t.float :U_MID_AREA
      t.float :U_MID_BMC
      t.float :U_MID_BMD
      t.float :U_UD_AREA
      t.float :U_UD_BMC
      t.float :U_UD_BMD
      t.float :RTOT_AREA
      t.float :RTOT_BMC
      t.float :RTOT_BMD
      t.float :UTOT_AREA
      t.float :UTOT_BMC
      t.float :UTOT_BMD
      t.float :RU13TOT_AREA
      t.float :RU13TOT_BMC
      t.float :RU13TOT_BMD
      t.float :RUMIDTOT_AREA
      t.float :RUMIDTOT_BMC
      t.float :RUMIDTOT_BMD
      t.float :RUUDTOT_AREA
      t.float :RUUDTOT_BMC
      t.float :RUUDTOT_BMD
      t.float :RUTOT_AREA
      t.float :RUTOT_BMC
      t.float :RUTOT_BMD
      t.integer :ROI_TYPE
      t.float :ROI_WIDTH
      t.float :ROI_HEIGHT
      t.integer :ARM_LENGTH
      t.string :PHYSICIAN_COMMENT
      t.timestamps
    end
  end
end
