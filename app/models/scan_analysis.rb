class ScanAnalysis < ActiveRecord::Base
  self.primary_key = "scanid"

  belongs_to :patient, foreign_key: "patient_key"

  has_one :hip, foreign_key: :scanid
  has_one :spine, foreign_key: :scanid
  has_one :forearm, foreign_key: :scanid

  scope :accession_lists, -> {
    joins(:patient)
    .where("accession_no is not null")
    .where("patients.identifier1 IS NOT NULL")
    .where("patients.last_name IS NOT NULL")
    .group(:accession_no)
    .order(scan_date: :desc)
  }

  def study
    type = read_attribute(:ref_type)
    case type
    when "S"
      self.spine
    when "H"
      self.hip
    when "R"
      self.forearm
    else
      nil
    end
  end

  # decide to use T or Z score according to age > 50 or menopaused.
  def t_or_z
    age = self.patient.age(self.scan_date)
    mp_age = self.patient.menopause_year.to_i
    (mp_age > 0 || age > 50) ? "t" : "z"
  end

  # find score for conclusion
  def score
    case self.t_or_z
    when 't'
      self.study.t_score
    when 'z'
      self.study.z_score
    end
  end

  def find_reference(bone_range="")
    ref_type = read_attribute(:ref_type)
    ethnicity = self.patient.ethnicity
    sex = self.patient.sex
    bone_range = self.study.bone_range if bone_range.empty?
    ReferenceCurve.where( if_current: 1,
                          reftype: ref_type,
                          ethnic: (ref_type == "R" ? nil : ethnicity),
                          sex: sex,
                          bonerange: bone_range).first
  end

  def type
    read_attribute(:ref_type)
  end

  def scan_type
    read_attribute(:scan_type)
  end

  def to_s
    case self.type
    when "S"
      "Spine"
    when "H"
      "Hip - " + self.study.side.capitalize
    when "R"
      "Forearm"
    else
      nil
    end
  end

  def acc
    read_attribute(:accession_no)
  end

  def scan_date
    read_attribute(:scan_date)
  end
end
