class CreateWBodies < ActiveRecord::Migration
  def change
    create_table :w_bodies do |t|
      t.string :patient_key
      t.string :scanid, :null => false
      t.string :serial_number, :null => false
      t.string :step_phant_id
      t.float :wbtot_area
      t.float :wbtot_bmc
      t.float :wbtot_bmd
      t.float :subtot_area
      t.float :subtot_bmc
      t.float :subtot_bmd
      t.float :head_area
      t.float :head_bmc
      t.float :head_bmd
      t.float :larm_area
      t.float :larm_bmc
      t.float :larm_bmd
      t.float :rarm_area
      t.float :rarm_bmc
      t.float :rarm_bmd
      t.float :lrib_area
      t.float :lrib_bmc
      t.float :lrib_bmd
      t.float :rrib_area
      t.float :rrib_bmc
      t.float :rrib_bmd
      t.float :t_s_area
      t.float :t_s_bmc
      t.float :t_s_bmd
      t.float :l_s_area
      t.float :l_s_bmc
      t.float :l_s_bmd
      t.float :pelv_area
      t.float :pelv_bmc
      t.float :pelv_bmd
      t.float :lleg_area
      t.float :lleg_bmc
      t.float :lleg_bmd
      t.float :rleg_area
      t.float :rleg_bmc
      t.float :rleg_bmd
      t.integer :roi_type
      t.float :roi_width
      t.float :roi_height
      t.string :physician_comment
      t.timestamps
    end
  end
end
