class Patient < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :last_name

  self.primary_key = "patient_key"

  scope :not_phantom, -> { where('phantom_id IS NULL') }

  has_many :Forearms, foreign_key: "patient_key"
  has_many :Spines, foreign_key: "patient_key"
  has_many :Hips, foreign_key: "patient_key"
  has_many :HipHsas, foreign_key: "patient_key"
  has_many :Laterals, foreign_key: "patient_key"
  has_many :ScanAnalyses, foreign_key: "patient_key"

  def name
    read_attribute(:last_name)
  end

  def birthday
    read_attribute(:birthdate)
  end

  def pid
    read_attribute(:identifier1)
  end

  def studies
    self.ScanAnalyses.select(:accession_no).distinct
  end

  def ethnicity
    read_attribute(:ethnicity)
  end

  ## use last_update for age calculation.
  def age(time = self.read_attribute(:last_update))
    time = time.to_datetime
    dob = self.birthday
    time.year - dob.year - ((time.month > dob.month || (time.month == dob.month && time.day >= dob.day)) ? 0 : 1)
  end
end
