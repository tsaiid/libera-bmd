class CreateHips < ActiveRecord::Migration
  def change
    create_table :hips do |t|
      t.string :patient_key
      t.string :scanid, :null => false
      t.string :serial_number, :null => false
      t.float :troch_area
      t.float :troch_bmc
      t.float :troch_bmd
      t.float :inter_area
      t.float :inter_bmc
      t.float :inter_bmd
      t.float :neck_area
      t.float :neck_bmc
      t.float :neck_bmd
      t.float :wards_area
      t.float :wards_bmc
      t.float :wards_bmd
      t.float :htot_area
      t.float :htot_bmc
      t.float :htot_bmd
      t.float :hstd_tot_bmd
      t.integer :roi_type
      t.float :roi_width
      t.float :roi_height
      t.float :axis_length
      t.string :physician_comment
      t.timestamps
    end
  end
end
