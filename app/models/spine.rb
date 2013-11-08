class Spine < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "PATIENT_KEY"
  belongs_to :ScanAnalysis, foreign_key: "SCANID"

  def area
    read_attribute(:TOT_AREA)
  end

  def bmc
    read_attribute(:TOT_BMD)
  end

  def bmd
    read_attribute(:TOT_BMD)
  end
end
