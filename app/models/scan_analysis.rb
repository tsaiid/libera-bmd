class ScanAnalysis < ActiveRecord::Base
  self.primary_key = "SCANID"

  belongs_to :Patient, foreign_key: "PATIENT_KEY"

  has_one :Hip, foreign_key: :SCANID
  has_one :Spine, foreign_key: :SCANID
  has_one :Forearm, foreign_key: :SCANID

  scope :accession_lists, -> { group(:ACCESSION_NO).order(SCAN_DATE: :desc) }

  def study
    type = read_attribute(:REF_TYPE)
    case type
    when "S"
      self.Spine
    when "H"
      self.Hip
    when "R"
      self.Forearm
    else
      nil
    end
  end

  def find_reference
    ref_type = read_attribute(:REF_TYPE)
    ethnicity = self.Patient.ethnicity
    ReferenceCurve.where(REFTYPE: ref_type, ETHNIC: ethnicity).first
    # incomplete.
  end

  def type
    read_attribute(:SCAN_TYPE)
  end

  def acc
    read_attribute(:ACCESSION_NO)
  end
end
