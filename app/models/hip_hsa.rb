class HipHsa < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "PATIENT_KEY"
end
