class ScanAnalysis < ActiveRecord::Base
  self.primary_key = "scanid"

  belongs_to :Patient, foreign_key: "patient_key"

  has_one :Hip, foreign_key: :scanid
  has_one :Spine, foreign_key: :scanid
  has_one :Forearm, foreign_key: :scanid

  scope :accession_lists, -> { group(:accession_no).order(scan_date: :desc) }

  def study
    type = read_attribute(:ref_type)
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
    ref_type = read_attribute(:ref_type)
    ethnicity = self.Patient.ethnicity
    ReferenceCurve.where(reftype: ref_type, ethnic: ethnicity).first
    # incomplete.
  end

  def type
    read_attribute(:scan_type)
  end

  def acc
    read_attribute(:accession_no)
  end

  def scan_date
    read_attribute(:scan_date)
  end
end
