class Patient < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :last_name

  self.primary_key = "PATIENT_KEY"

  scope :not_phantom, -> { where('PHANTOM_ID IS NULL') }

  has_many :Forearms, foreign_key: "PATIENT_KEY"
  has_many :Spines, foreign_key: "PATIENT_KEY"
  has_many :Hips, foreign_key: "PATIENT_KEY"
  has_many :HipHsas, foreign_key: "PATIENT_KEY"
  has_many :Laterals, foreign_key: "PATIENT_KEY"
  has_many :ScanAnalyses, foreign_key: "PATIENT_KEY"

  def name
    read_attribute(:LAST_NAME)
  end

  def studies
    self.ScanAnalyses.select(:ACCESSION_NO).distinct
  end

end
