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

  def find_reference
    ref_type = read_attribute(:ref_type)
    ethnicity = self.patient.ethnicity
    sex = self.patient.sex
    bone_range = self.study.bone_range
    ReferenceCurve.where( if_current: 1,
                          reftype: ref_type,
                          ethnic: ethnicity,
                          sex: sex,
                          bonerange: bone_range).first
    # incomplete.
  end

  def z_scores
    self.study.z_scores
  end

  def type
    read_attribute(:ref_type)
  end

  def to_s
    case self.type
    when "S"
      "Spine"
    when "H"
      "Hip"
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
