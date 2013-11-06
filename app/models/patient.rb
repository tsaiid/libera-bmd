class Patient < ActiveRecord::Base
  self.primary_key = "PATIENT_KEY"

  has_many :Forearms, foreign_key: "PATIENT_KEY"
  has_many :Spines, foreign_key: "PATIENT_KEY"
  has_many :Hips, foreign_key: "PATIENT_KEY"
  has_many :HipHsas, foreign_key: "PATIENT_KEY"
  has_many :Laterals, foreign_key: "PATIENT_KEY"
  has_many :ScanAnalyses, foreign_key: "PATIENT_KEY"
end
