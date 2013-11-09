class CreateForearms < ActiveRecord::Migration
  def change
    create_table :forearms do |t|
      t.string :patient_key 
      t.string :scanid
      t.string :serial_number, :null => false
      t.float :r_13_area
      t.float :r_13_bmc
      t.float :r_13_bmd
      t.float :r_mid_area
      t.float :r_mid_bmc
      t.float :r_mid_bmd
      t.float :r_ud_area
      t.float :r_ud_bmc
      t.float :r_ud_bmd
      t.float :u_13_area
      t.float :u_13_bmc
      t.float :u_13_bmd
      t.float :u_mid_area
      t.float :u_mid_bmc
      t.float :u_mid_bmd
      t.float :u_ud_area
      t.float :u_ud_bmc
      t.float :u_ud_bmd
      t.float :rtot_area
      t.float :rtot_bmc
      t.float :rtot_bmd
      t.float :utot_area
      t.float :utot_bmc
      t.float :utot_bmd
      t.float :ru13tot_area
      t.float :ru13tot_bmc
      t.float :ru13tot_bmd
      t.float :rumidtot_area
      t.float :rumidtot_bmc
      t.float :rumidtot_bmd
      t.float :ruudtot_area
      t.float :ruudtot_bmc
      t.float :ruudtot_bmd
      t.float :rutot_area
      t.float :rutot_bmc
      t.float :rutot_bmd
      t.integer :roi_type
      t.float :roi_width
      t.float :roi_height
      t.integer :arm_length
      t.string :physician_comment
      t.timestamps
    end
  end
end
