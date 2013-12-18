class Hip < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  scope :pcu, -> { joins(:scan_analysis).where("wl_sched_proc_step_desc LIKE ?", "%PCU%") }

  def levels
    array = []
    array <<= {label: "Neck", bone_range: "1...", area: neck_area, bmc: neck_bmc, bmd: neck_bmd, noncollapse: true}
    array <<= {label: "Troch", bone_range: ".2..", area: troch_area, bmc: troch_bmc, bmd: troch_bmd}
    array <<= {label: "Inter", bone_range: "..3.", area: inter_area, bmc: inter_bmc, bmd: inter_bmd}
    array <<= {label: "Total", bone_range: "123.", area: htot_area, bmc: htot_bmc, bmd: htot_bmd}
    array <<= {label: "Ward's", bone_range: "...4", area: wards_area, bmc: wards_bmc, bmd: wards_bmd}

    ## calculate T- and Z-scores
    array.each do |a|
      a = calculate_t_z_scores(a)
    end
  end

  def calculate_t_z_scores(level)
    age = patient.age(scan_analysis.scan_date)
    ref_curve = scan_analysis.find_reference(level[:bone_range])

    level[:t_score] = ref_curve.t_score(level[:bmd])
    level[:peak_reference] = ref_curve.peak_reference(level[:bmd])
    level[:z_score] = ref_curve.z_score(age, level[:bmd])
    level[:age_matched] = ref_curve.age_matched(age, level[:bmd])
    level
  end

  def t_score
    level = calculate_t_z_scores({label: "Neck", bone_range: "1...", area: neck_area, bmc: neck_bmc, bmd: neck_bmd})
    level[:t_score].round(1)
  end

  def z_score
    level = calculate_t_z_scores({label: "Neck", bone_range: "1...", area: neck_area, bmc: neck_bmc, bmd: neck_bmd})
    level[:z_score].round(1)
  end

  def report_str
    level = calculate_t_z_scores({label: "Neck", bone_range: "1...", area: neck_area, bmc: neck_bmc, bmd: neck_bmd})
    str = "The BMD of #{self.side} proximal femur is #{level[:bmd].round(3)} gm/cm2"
    case scan_analysis.t_or_z
    when 't'
      str += ", and is about #{level[:peak_reference].round(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round(1)})."
    when 'z'
      str += ". The age matched percentage is about #{level[:age_matched].round(0)}\% (Z-score = #{level[:z_score].round(1)})."
    end
    str
  end

  def side
    case scan_analysis.scan_type
    when 2
      "left"
    when 3
      "right"
    else
      nil
    end
  end

  def side_abbr
    case scan_analysis.scan_type
    when 2
      '<button type="button" class="btn btn-default btn-xs" disabled="disabled">Ｌ</button>'
    when 3
      '<button type="button" class="btn btn-default btn-xs" disabled="disabled">Ｒ</button>'
    else
      nil
    end
  end
end
