class Hip < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  def levels
    array = []
    array <<= {label: "Neck", area: self.neck_area, bmc: self.neck_bmc, bmd: self.neck_bmd}
    array <<= {label: "Troch", area: self.troch_area, bmc: self.troch_bmc, bmd: self.troch_bmd}
    array <<= {label: "Inter", area: self.inter_area, bmc: self.inter_bmc, bmd: self.inter_bmd}
    array <<= {label: "Total", area: self.total_area, bmc: self.total_bmc, bmd: self.total_bmd}
    array <<= {label: "Ward's", area: self.wards_area, bmc: self.wards_bmc, bmd: self.wards_bmd}
  end

  def neck_area
    read_attribute(:neck_area)
  end

  def neck_bmc
    read_attribute(:neck_bmc)
  end

  def neck_bmd
    read_attribute(:neck_bmd)
  end

  def troch_area
    read_attribute(:troch_area)
  end

  def troch_bmc
    read_attribute(:troch_bmc)
  end

  def troch_bmd
    read_attribute(:troch_bmd)
  end

  def inter_area
    read_attribute(:inter_area)
  end

  def inter_bmc
    read_attribute(:inter_bmc)
  end

  def inter_bmd
    read_attribute(:inter_bmd)
  end

  def total_area
    read_attribute(:htot_area)
  end

  def total_bmc
    read_attribute(:htot_bmc)
  end

  def total_bmd
    read_attribute(:htot_bmd)
  end

  def wards_area
    read_attribute(:wards_area)
  end

  def wards_bmc
    read_attribute(:wards_bmc)
  end

  def wards_bmd
    read_attribute(:wards_bmd)
  end
end
