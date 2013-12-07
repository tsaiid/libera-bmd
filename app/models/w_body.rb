class WBody < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  def total_hash
    {label: "Total", area: wbtot_area, bmc: wbtot_bmc, bmd: wbtot_bmd, bonerange: nil}
  end

  def levels
    array = []
    array <<= {label: "L Arm", area: larm_area, bmc: larm_bmc, bmd: larm_bmd}
    array <<= {label: "R Arm", area: rarm_area, bmc: rarm_bmc, bmd: rarm_bmd}
    array <<= {label: "L Ribs", area: lrib_area, bmc: lrib_bmc, bmd: lrib_bmd}
    array <<= {label: "R Ribs", area: rrib_area, bmc: rrib_bmc, bmd: rrib_bmd}
    array <<= {label: "T Spine", area: t_s_area, bmc: t_s_bmc, bmd: t_s_bmd}
    array <<= {label: "L Spine", area: l_s_area, bmc: l_s_bmc, bmd: l_s_bmd}
    array <<= {label: "Pelvis", area: pelv_area, bmc: pelv_bmc, bmd: pelv_bmd}
    array <<= {label: "L Leg", area: lleg_area, bmc: lleg_bmc, bmd: lleg_bmd}
    array <<= {label: "R Leg", area: rleg_area, bmc: rleg_bmc, bmd: rleg_bmd}
    array <<= {label: "Subtotal", area: subtot_area, bmc: subtot_bmc, bmd: subtot_bmd}
    array <<= {label: "Head", area: head_area, bmc: head_bmc, bmd: head_bmd}

    ## calculate T- and Z-scores, only for total
    array <<= calculate_t_z_scores(total_hash)
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
    level = calculate_t_z_scores(total_hash)
    level[:t_score].round(1)
  end

  def z_score
    level = calculate_t_z_scores(total_hash)
    level[:z_score].round(1)
  end

  def report_str
    level = calculate_t_z_scores(total_hash)
    str = "The BMD of whole body is #{level[:bmd].round(3)} gm/cm2"
    case scan_analysis.t_or_z
    when 't'
      str += ", and is about #{level[:peak_reference].round(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round(1)})."
    when 'z'
      str += ". The age matched percentage is about #{level[:age_matched].round(0)}\% (Z-score = #{level[:z_score].round(1)})."
    end
    str
  end
end
