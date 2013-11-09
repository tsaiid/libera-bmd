class CreateHipHsas < ActiveRecord::Migration
  def change
    create_table :hip_hsas do |t|
      t.string :patient_key
      t.string :scanid, :null => false
      t.string :serial_number, :null => false
      t.float :nn_bmd
      t.float :nn_csa
      t.float :nn_csmi
      t.float :nn_width
      t.float :nn_ed
      t.float :nn_act
      t.float :nn_pcd
      t.float :nn_cmp
      t.float :nn_sect_mod
      t.float :nn_br
      t.float :it_bmd
      t.float :it_csa
      t.float :it_csmi
      t.float :it_width
      t.float :it_ed
      t.float :it_act
      t.float :it_pcd
      t.float :it_cmp
      t.float :it_sect_mod
      t.float :it_br
      t.float :fs_bmd
      t.float :fs_csa
      t.float :fs_csmi
      t.float :fs_width
      t.float :fs_ed
      t.float :fs_act
      t.float :fs_pcd
      t.float :fs_cmp
      t.float :fs_sect_mod
      t.float :fs_br
      t.float :shaft_neck_angle
      t.float :var1
      t.float :var2
      t.float :var3
      t.float :var4
      t.float :var5
      t.float :var6
      t.timestamps
    end
  end
end
