class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :forearms, :scanid, :unique => true
    add_index :hip_hsas, :scanid, :unique => true
    add_index :hips, :scanid, :unique => true
    add_index :laterals, :scanid, :unique => true
    add_index :spines, :scanid, :unique => true
    add_index :w_bodies, :scanid, :unique => true
  end
end
