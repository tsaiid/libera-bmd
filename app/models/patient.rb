class Patient < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :last_name

  self.primary_key = "patient_key"

  scope :not_phantom, -> { where('phantom_id IS NULL') }

  has_many :forearms, foreign_key: "patient_key"
  has_many :spines, foreign_key: "patient_key"
  has_many :hips, foreign_key: "patient_key"
  has_many :hip_hsas, foreign_key: "patient_key"
  has_many :laterals, foreign_key: "patient_key"
  has_many :scan_analyses, foreign_key: "patient_key"

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
    self.scan_analyses.select(:accession_no).distinct
  end

  def ethnicity
    read_attribute(:ethnicity)
  end

  def sex
    read_attribute(:sex)
  end

  ## use last_update for age calculation.
  def age(time = self.read_attribute(:last_update))
    time = time.to_datetime
    dob = self.birthday
    time.year - dob.year - ((time.month > dob.month || (time.month == dob.month && time.day >= dob.day)) ? 0 : 1)
  end

  def menopause_year
    mp_year = read_attribute(:menopause_year)
    mp_year > 0 ? mp_year : ""
  end
end
