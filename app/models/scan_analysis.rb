class ScanAnalysis < ActiveRecord::Base
  self.primary_key = "SCANID"

  belongs_to :Patient, foreign_key: "PATIENT_KEY"

  has_many :Hips, foreign_key: :SCANID
  has_many :Spines, foreign_key: :SCANID
  has_many :Forearms, foreign_key: :SCANID

  def type
    read_attribute(:SCAN_TYPE)
  end

  def acc
    read_attribute(:ACCESSION_NO)
  end
end
