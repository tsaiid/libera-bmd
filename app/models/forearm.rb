class Forearm < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  def ru13_area
    read_attribute(:ru13tot_area)
  end

  def ru13_bmc
    read_attribute(:ru13tot_bmc)
  end

  def ru13_bmd
    read_attribute(:ru13tot_bmd)
  end

  def rumid_area
    read_attribute(:rumidtot_area)
  end

  def rumid_bmc
    read_attribute(:rumidtot_bmc)
  end

  def rumid_bmd
    read_attribute(:rumidtot_bmd)
  end

  def ruud_area
    read_attribute(:ruudtot_area)
  end

  def ruud_bmc
    read_attribute(:ruudtot_bmc)
  end

  def ruud_bmd
    read_attribute(:ruudtot_bmd)
  end

  def rutot_area
    read_attribute(:rutot_area)
  end

  def rutot_bmc
    read_attribute(:rutot_bmc)
  end

  def rutot_bmd
    read_attribute(:rutot_bmd)
  end
end
