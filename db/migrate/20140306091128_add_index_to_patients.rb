class AddIndexToPatients < ActiveRecord::Migration
  def change
	add_index :patients, :patient_key, :unique => true
  end
end
