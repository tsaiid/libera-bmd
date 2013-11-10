class Lateral < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
end
