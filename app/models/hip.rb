class Hip < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "PATIENT_KEY"
  belongs_to :ScanAnalysis, foreign_key: "SCANID"

  def neck_area
    read_attribute(:NECK_AREA)
  end

  def neck_bmc
    read_attribute(:NECK_BMC)
  end

  def neck_bmd
    read_attribute(:NECK_BMD)
  end

  def troch_area
    read_attribute(:TROCH_AREA)
  end

  def troch_bmc
    read_attribute(:TROCH_BMC)
  end

  def troch_bmd
    read_attribute(:TROCH_BMD)
  end

  def inter_area
    read_attribute(:INTER_AREA)
  end

  def inter_bmc
    read_attribute(:INTER_BMC)
  end

  def inter_bmd
    read_attribute(:INTER_BMD)
  end

  def total_area
    read_attribute(:HTOT_AREA)
  end

  def total_bmc
    read_attribute(:HTOT_BMC)
  end

  def total_bmd
    read_attribute(:HTOT_BMD)
  end

  def wards_area
    read_attribute(:WARDS_AREA)
  end

  def wards_bmc
    read_attribute(:WARDS_BMC)
  end

  def wards_bmd
    read_attribute(:WARDS_BMD)
  end
end
