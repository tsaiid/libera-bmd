module SpineGeneral
  def bone_range
    range = ""
    range += l1_included? ? "1" : "."
    range += l2_included? ? "2" : "."
    range += l3_included? ? "3" : "."
    range += l4_included? ? "4" : "."
  end

  def l1_included?
    !l1_included.nil? && !l1_included.zero?
  end

  def l2_included?
    !l2_included.nil? && !l2_included.zero?
  end

  def l3_included?
    !l3_included.nil? && !l3_included.zero?
  end

  def l4_included?
    !l4_included.nil? && !l4_included.zero?
  end

  def levels
    array = []
    array <<= {label: "L1", bone_range: "1...", area: l1_area, bmc: l1_bmc, bmd: l1_bmd} if l1_included?
    array <<= {label: "L2", bone_range: ".2..", area: l2_area, bmc: l2_bmc, bmd: l2_bmd} if l2_included?
    array <<= {label: "L3", bone_range: "..3.", area: l3_area, bmc: l3_bmc, bmd: l3_bmd} if l3_included?
    array <<= {label: "L4", bone_range: "...4", area: l4_area, bmc: l4_bmc, bmd: l4_bmd} if l4_included?
    array <<= {label: "Total", bone_range: bone_range, area: tot_area, bmc: tot_bmc, bmd: tot_bmd, noncollapse: true}

    ## calculate T- and Z-scores
    array.each do |a|
      a = calculate_t_z_scores(a)
    end
  end

  def calculate_t_z_scores(level)
    age = patient.age(scan_analysis.scan_date)
    ref_curve = scan_analysis.find_reference(level[:bone_range])

    if !ref_curve.nil?
      level[:t_score] = ref_curve.t_score(level[:bmd])
      level[:peak_reference] = ref_curve.peak_reference(level[:bmd])
      level[:z_score] = ref_curve.z_score(age, level[:bmd])
      level[:age_matched] = ref_curve.age_matched(age, level[:bmd])
    else
      level[:error] = "No Ref Curve"
    end
    level
  end

  def t_score
    level = calculate_t_z_scores({label: "Total", bone_range: bone_range, area: tot_area, bmc: tot_bmc, bmd: tot_bmd})
    level[:error] ? level[:error] : level[:t_score].round(1)
  end

  def z_score
    level = calculate_t_z_scores({label: "Total", bone_range: bone_range, area: tot_area, bmc: tot_bmc, bmd: tot_bmd})
    level[:error] ? level[:error] : level[:z_score].round(1)
  end
end