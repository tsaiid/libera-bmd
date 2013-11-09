class CreateLaterals < ActiveRecord::Migration
  def change
    create_table :laterals do |t|
      t.string :patient_key
      t.string :scanid, :null => false
      t.string :serial_number, :null => false
      t.float :renorm_factor
      t.float :renorm_report
      t.string :bcomp_scanid
      t.string :bcomp_serial_number
      t.integer :no_regions
      t.integer :starting_region
      t.integer :l1_included, :null => false
      t.integer :l2_included, :null => false
      t.integer :l3_included, :null => false
      t.integer :l4_included, :null => false
      t.integer :l5_included, :null => false
      t.float :l1_area
      t.float :l1_bmc
      t.float :l1_bmd
      t.float :l1_vbmd
      t.float :l1_width
      t.float :l2_area
      t.float :l2_bmc
      t.float :l2_bmd
      t.float :l2_vbmd
      t.float :l2_width
      t.float :l3_area
      t.float :l3_bmc
      t.float :l3_bmd
      t.float :l3_vbmd
      t.float :l3_width
      t.float :l4_area
      t.float :l4_bmc
      t.float :l4_bmd
      t.float :l4_vbmd
      t.float :l4_width
      t.float :l5_area
      t.float :l5_bmc
      t.float :l5_bmd
      t.float :l5_vbmd
      t.float :l5_width
      t.float :l1_mid_area
      t.float :l1_mid_bmc
      t.float :l1_mid_bmd
      t.float :l1_mid_vbmd
      t.float :l2_mid_area
      t.float :l2_mid_bmc
      t.float :l2_mid_bmd
      t.float :l2_mid_vbmd
      t.float :l3_mid_area
      t.float :l3_mid_bmc
      t.float :l3_mid_bmd
      t.float :l3_mid_vbmd
      t.float :l4_mid_area
      t.float :l4_mid_bmc
      t.float :l4_mid_bmd
      t.float :l4_mid_vbmd
      t.float :l5_mid_area
      t.float :l5_mid_bmc
      t.float :l5_mid_bmd
      t.float :l5_mid_vbmd
      t.float :ltot_area
      t.float :ltot_bmc
      t.float :ltot_bmd
      t.float :ltot_vbmd
      t.float :midtot_area
      t.float :midtot_bmc
      t.float :midtot_bmd
      t.float :midtot_vbmd
      t.integer :roi_type
      t.float :roi_width
      t.float :roi_height
      t.float :l1_p_a_area
      t.float :l1_p_a_bmc
      t.float :l2_p_a_area
      t.float :l2_p_a_bmc
      t.float :l3_p_a_area
      t.float :l3_p_a_bmc
      t.float :l4_p_a_area
      t.float :l4_p_a_bmc
      t.float :l5_p_a_area
      t.float :l5_p_a_bmc
      t.float :total_p_a_area
      t.float :total_p_a_bmc
      t.string :physician_comment
      t.timestamps
    end
  end
end
