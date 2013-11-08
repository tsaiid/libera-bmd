class Forearm < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "PATIENT_KEY"
  belongs_to :ScanAnalysis, foreign_key: "SCANID"
end
