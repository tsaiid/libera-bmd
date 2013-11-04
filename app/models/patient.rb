class Patient < ActiveRecord::Base
  self.primary_key = "PATIENT_KEY"

  has_many :Forearms, foreign_key: "PATIENT_KEY"
  has_many :Spines, foreign_key: "PATIENT_KEY"
end
