class Spine < ActiveRecord::Base
  belongs_to :Patient, foreign_key: "patient_key"
  belongs_to :ScanAnalysis, foreign_key: "scanid"

  def bone_range
    range = ""
    range += read_attribute(:l1_included) ? "1" : "."
    range += read_attribute(:l2_included) ? "2" : "."
    range += read_attribute(:l3_included) ? "3" : "."
    range += read_attribute(:l4_included) ? "4" : "."
  end

  def levels
    array = []
    array <<= {label: "L1", area: self.l1_area, bmc: self.l1_bmc, bmd: self.l1_bmd} if read_attribute(:l1_included)
    array <<= {label: "L2", area: self.l2_area, bmc: self.l2_bmc, bmd: self.l2_bmd} if read_attribute(:l2_included)
    array <<= {label: "L3", area: self.l3_area, bmc: self.l3_bmc, bmd: self.l3_bmd} if read_attribute(:l3_included)
    array <<= {label: "L4", area: self.l4_area, bmc: self.l4_bmc, bmd: self.l4_bmd} if read_attribute(:l4_included)
    array <<= {label: "Total", area: self.tot_area, bmc: self.tot_bmc, bmd: self.tot_bmd}
  end

  def l1_area
    read_attribute(:l1_area)
  end

  def l1_bmc
    read_attribute(:l1_bmd)
  end

  def l1_bmd
    read_attribute(:l1_bmd)
  end

  def l2_area
    read_attribute(:l2_area)
  end

  def l2_bmc
    read_attribute(:l2_bmd)
  end

  def l2_bmd
    read_attribute(:l2_bmd)
  end

  def l3_area
    read_attribute(:l3_area)
  end

  def l3_bmc
    read_attribute(:l3_bmd)
  end

  def l3_bmd
    read_attribute(:l3_bmd)
  end

  def l4_area
    read_attribute(:l4_area)
  end

  def l4_bmc
    read_attribute(:l4_bmd)
  end

  def l4_bmd
    read_attribute(:l4_bmd)
  end

  def tot_area
    read_attribute(:tot_area)
  end

  def tot_bmc
    read_attribute(:tot_bmd)
  end

  def tot_bmd
    read_attribute(:tot_bmd)
  end
end
