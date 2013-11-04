class CreatePatients < ActiveRecord::Migration
  def change
    create_table :PATIENTS do |t|
      t.string :PATIENT_KEY
      t.string :STUDY
      t.string :LAST_NAME
      t.string :FIRST_NAME
      t.string :MID_INITIAL
      t.string :IDENTIFIER1
      t.string :IDENTIFIER2
      t.datetime :BIRTHDATE
      t.string :SEX
      t.float :WEIGHT
      t.float :HEIGHT
      t.string :ETHNICITY
      t.string :REF_PHYSICIAN
      t.string :PAT_COMMENT
      t.integer :MENOPAUSE_YEAR
      t.float :RDFLOAT
      t.string :RDTEXT
      t.string :PLAN
      t.string :GROUP
      t.string :INSURANCE
      t.string :ADDRESS1
      t.string :ADDRESS2
      t.string :CITY
      t.string :STATE
      t.string :POSTAL
      t.string :COUNTRY
      t.string :PHANTOM_ID
      t.string :PHANTOM_TYPE
      t.datetime :LAST_UPDATE
      t.datetime :LAST_EXPORT
      t.float :BMI
      t.timestamps
    end
  end
end
