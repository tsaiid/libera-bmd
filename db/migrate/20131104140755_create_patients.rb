class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients, :id => false, :primary_key => :patient_key do |t|
      t.string :patient_key, :null => false
      t.string :study
      t.string :last_name
      t.string :first_name
      t.string :mid_initial
      t.string :identifier1
      t.string :identifier2
      t.datetime :birthdate
      t.string :sex
      t.float :weight
      t.float :height
      t.string :ethnicity
      t.string :ref_physician
      t.string :pat_comment
      t.integer :menopause_year
      t.float :rdfloat
      t.string :rdtext
      t.string :plan
      t.string :group
      t.string :insurance
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :phantom_id
      t.string :phantom_type
      t.datetime :last_update
      t.datetime :last_export
      t.float :bmi
      t.timestamps
    end
  end
end
