class Spine < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  def bone_range
    range = ""
    range += read_attribute(:l1_included) ? "1" : "."
    range += read_attribute(:l2_included) ? "2" : "."
    range += read_attribute(:l3_included) ? "3" : "."
    range += read_attribute(:l4_included) ? "4" : "."
  end

  def levels
    array = []
    array <<= {label: "L1", bone_range: "1...", area: self.l1_area, bmc: self.l1_bmc, bmd: self.l1_bmd} if read_attribute(:l1_included)
    array <<= {label: "L2", bone_range: ".2..", area: self.l2_area, bmc: self.l2_bmc, bmd: self.l2_bmd} if read_attribute(:l2_included)
    array <<= {label: "L3", bone_range: "..3.", area: self.l3_area, bmc: self.l3_bmc, bmd: self.l3_bmd} if read_attribute(:l3_included)
    array <<= {label: "L4", bone_range: "...4", area: self.l4_area, bmc: self.l4_bmc, bmd: self.l4_bmd} if read_attribute(:l4_included)
    array <<= {label: "Total", bone_range: "1234", area: self.tot_area, bmc: self.tot_bmc, bmd: self.tot_bmd}

    ## calculate Z-score
    age = self.patient.age
    array.each do |a|
      ref_curve = self.scan_analysis.find_reference(a[:bone_range])
      a[:t_score] = ref_curve.t_score(a[:bmd])
      a[:peak_reference] = ref_curve.peak_reference(a[:bmd])
      a[:z_score] = ref_curve.z_score(age, a[:bmd])
      a[:age_matched] = ref_curve.age_matched(age, a[:bmd])
    end
  end

  def l1_area
    read_attribute(:l1_area)
  end

  def l1_bmc
    read_attribute(:l1_bmc)
  end

  def l1_bmd
    read_attribute(:l1_bmd)
  end

  def l2_area
    read_attribute(:l2_area)
  end

  def l2_bmc
    read_attribute(:l2_bmc)
  end

  def l2_bmd
    read_attribute(:l2_bmd)
  end

  def l3_area
    read_attribute(:l3_area)
  end

  def l3_bmc
    read_attribute(:l3_bmc)
  end

  def l3_bmd
    read_attribute(:l3_bmd)
  end

  def l4_area
    read_attribute(:l4_area)
  end

  def l4_bmc
    read_attribute(:l4_bmc)
  end

  def l4_bmd
    read_attribute(:l4_bmd)
  end

  def tot_area
    read_attribute(:tot_area)
  end

  def tot_bmc
    read_attribute(:tot_bmc)
  end

  def tot_bmd
    read_attribute(:tot_bmd)
  end
end
