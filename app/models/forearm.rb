class Forearm < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  def levels
    array = []
    array <<= {label: "RU 1/3", bone_range: "1..", area: self.ru13_area, bmc: self.ru13_bmc, bmd: self.ru13_bmd}
    array <<= {label: "RU Mid", bone_range: ".2.", area: self.rumid_area, bmc: self.rumid_bmc, bmd: self.rumid_bmd}
    array <<= {label: "RU UD", bone_range: "..3", area: self.ruud_area, bmc: self.ruud_bmc, bmd: self.ruud_bmd}
    array <<= {label: "Total", bone_range: "123", area: self.rutot_area, bmc: self.rutot_bmc, bmd: self.rutot_bmd}

    ## calculate T- and Z-scores
    array.each do |a|
      a = calculate_t_z_scores(a)
    end
  end

  def calculate_t_z_scores(level)
    age = self.patient.age(self.scan_analysis.scan_date)
    ref_curve = self.scan_analysis.find_reference(level[:bone_range])

    level[:t_score] = ref_curve.t_score(level[:bmd])
    level[:peak_reference] = ref_curve.peak_reference(level[:bmd])
    level[:z_score] = ref_curve.z_score(age, level[:bmd])
    level[:age_matched] = ref_curve.age_matched(age, level[:bmd])
    level
  end

  def t_score
    level = calculate_t_z_scores({label: "RU 1/3", bone_range: "1..", area: self.ru13_area, bmc: self.ru13_bmc, bmd: self.ru13_bmd})
    level[:t_score].round(1)
  end

  def z_score
    level = calculate_t_z_scores({label: "RU 1/3", bone_range: "1..", area: self.ru13_area, bmc: self.ru13_bmc, bmd: self.ru13_bmd})
    level[:z_score].round(1)
  end

  def report_str
    level = calculate_t_z_scores({label: "RU 1/3", bone_range: "1..", area: self.ru13_area, bmc: self.ru13_bmc, bmd: self.ru13_bmd})
    str = "The BMD of #{self.side} 1/3 forearm is #{level[:bmd].round(3)} gm/cm2"
    case self.scan_analysis.t_or_z
    when 't'
      str += ", and is about #{level[:peak_reference].round(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round(1)})."
    when 'z'
      str += ". The age matched percentage is about #{level[:age_matched].round(0)}\% (Z-score = #{level[:z_score].round(1)})."
    end
    str
  end

  def side
    case self.scan_analysis.scan_type
    when 6
      "left"
    when 7
      "right"
    else
      nil
    end
  end

  def side_abbr
    case self.scan_analysis.scan_type
    when 6
      '<button type="button" class="btn btn-default btn-xs" disabled="disabled">Ｌ</button>'
    when 7
      '<button type="button" class="btn btn-default btn-xs" disabled="disabled">Ｒ</button>'
    else
      nil
    end
  end

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
