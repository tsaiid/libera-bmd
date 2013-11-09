class CreateSpines < ActiveRecord::Migration
  def change
    create_table :spines do |t|
      t.string :patient_key
      t.string :scanid, :null => false
      t.string :serial_number, :null => false
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
      t.float :l2_area
      t.float :l2_bmc
      t.float :l2_bmd
      t.float :l3_area
      t.float :l3_bmc
      t.float :l3_bmd
      t.float :l4_area
      t.float :l4_bmc
      t.float :l4_bmd
      t.float :l5_area
      t.float :l5_bmc
      t.float :l5_bmd
      t.float :tot_area
      t.float :tot_bmc
      t.float :tot_bmd
      t.float :std_tot_bmd
      t.integer :roi_type
      t.float :roi_width
      t.float :roi_height
      t.string :physician_comment
      t.timestamps
    end
  end
end
