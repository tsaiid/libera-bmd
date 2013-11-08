class Forearm < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "PATIENT_KEY"
  belongs_to :ScanAnalysis, foreign_key: "SCANID"

  def ru13_area
    read_attribute(:RU13TOT_AREA)
  end

  def ru13_bmc
    read_attribute(:RU13TOT_BMC)
  end

  def ru13_bmd
    read_attribute(:RU13TOT_BMD)
  end

  def rumid_area
    read_attribute(:RUMIDTOT_AREA)
  end

  def rumid_bmc
    read_attribute(:RUMIDTOT_BMC)
  end

  def rumid_bmd
    read_attribute(:RUMIDTOT_BMD)
  end

  def ruud_area
    read_attribute(:RUUDTOT_AREA)
  end

  def ruud_bmc
    read_attribute(:RUUDTOT_BMC)
  end

  def ruud_bmd
    read_attribute(:RUUDTOT_BMD)
  end

  def rutot_area
    read_attribute(:RUTOT_AREA)
  end

  def rutot_bmc
    read_attribute(:RUTOT_BMC)
  end

  def rutot_bmd
    read_attribute(:RUTOT_BMD)
  end
end
