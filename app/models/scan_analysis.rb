class ScanAnalysis < ActiveRecord::Base
  self.primary_key = "scanid"

  belongs_to :patient, foreign_key: "patient_key"

  has_one :hip, foreign_key: :scanid
  has_one :spine, foreign_key: :scanid
  has_one :forearm, foreign_key: :scanid

  scope :accession_lists, -> { joins(:patient).where("accession_no is not null and patients.identifier1 is not null").group(:accession_no).order(scan_date: :desc) }

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
