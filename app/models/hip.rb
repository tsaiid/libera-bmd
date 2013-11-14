class Hip < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  def levels
    array = []
    array <<= {label: "Neck", bone_range: "1...", area: self.neck_area, bmc: self.neck_bmc, bmd: self.neck_bmd}
    array <<= {label: "Troch", bone_range: ".2..", area: self.troch_area, bmc: self.troch_bmc, bmd: self.troch_bmd}
    array <<= {label: "Inter", bone_range: "..3.", area: self.inter_area, bmc: self.inter_bmc, bmd: self.inter_bmd}
    array <<= {label: "Total", bone_range: "123.", area: self.total_area, bmc: self.total_bmc, bmd: self.total_bmd}
    array <<= {label: "Ward's", bone_range: "...4", area: self.wards_area, bmc: self.wards_bmc, bmd: self.wards_bmd}

    ## calculate T- and Z-scores
    array.each do |a|
      a = calculate_t_z_scores(a)
    end
  end

  def calculate_t_z_scores(level)
    age = self.patient.age
    ref_curve = self.scan_analysis.find_reference(level[:bone_range])

    level[:t_score] = ref_curve.t_score(level[:bmd])
    level[:peak_reference] = ref_curve.peak_reference(level[:bmd])
    level[:z_score] = ref_curve.z_score(age, level[:bmd])
    level[:age_matched] = ref_curve.age_matched(age, level[:bmd])
    level
  end

  def report_str
    level = calculate_t_z_scores({label: "Neck", bone_range: "1...", area: self.neck_area, bmc: self.neck_bmc, bmd: self.neck_bmd})
    age = self.patient.age
    mp_age = self.patient.menopause_year.to_i
    str = "The BMD of proximal femur is #{level[:bmd].round(3)} gm/cm2"
    if mp_age > 0
      str += ", and is about #{level[:peak_reference].round(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round(1)})."
    else
      str += ". The age matched percentage is about #{level[:age_matched].round(0)}\% (Z-score = #{level[:z_score].round(1)})."
    end
    str
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
