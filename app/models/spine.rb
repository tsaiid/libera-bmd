class Spine < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "PATIENT_KEY"
  belongs_to :ScanAnalysis, foreign_key: "SCANID"

  def bone_range
    range = ""
    range += read_attribute(:L1_INCLUDED) ? "1" : "."
    range += read_attribute(:L2_INCLUDED) ? "2" : "."
    range += read_attribute(:L3_INCLUDED) ? "3" : "."
    range += read_attribute(:L4_INCLUDED) ? "4" : "."
  end

  def l1_area
    read_attribute(:L1_AREA)
  end

  def l1_bmc
    read_attribute(:L1_BMD)
  end

  def l1_bmd
    read_attribute(:L1_BMD)
  end

  def l2_area
    read_attribute(:L2_AREA)
  end

  def l2_bmc
    read_attribute(:L2_BMD)
  end

  def l2_bmd
    read_attribute(:L2_BMD)
  end

  def l3_area
    read_attribute(:L3_AREA)
  end

  def l3_bmc
    read_attribute(:L3_BMD)
  end

  def l3_bmd
    read_attribute(:L3_BMD)
  end

  def l4_area
    read_attribute(:L4_AREA)
  end

  def l4_bmc
    read_attribute(:L4_BMD)
  end

  def l4_bmd
    read_attribute(:L4_BMD)
  end

  def tot_area
    read_attribute(:TOT_AREA)
  end

  def tot_bmc
    read_attribute(:TOT_BMD)
  end

  def tot_bmd
    read_attribute(:TOT_BMD)
  end
end
