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

  def birthday
    read_attribute(:BIRTHDATE)
  end

  def studies
    self.ScanAnalyses.select(:ACCESSION_NO).distinct
  end

  def ethnicity
    read_attribute(:ETHNICITY)
  end

  ## use LAST_UPDATE for age calculation.
  def age(time = self.read_attribute(:LAST_UPDATE))
    time = time.to_datetime
    dob = self.birthday
    time.year - dob.year - ((time.month > dob.month || (time.month == dob.month && time.day >= dob.day)) ? 0 : 1)
  end
end
