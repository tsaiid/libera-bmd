class ScanAnalysis < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "PATIENT_KEY"

  def type
    read_attribute(:SCAN_TYPE)
  end
end
