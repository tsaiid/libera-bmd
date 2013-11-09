class Lateral < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "patient_key"
end
