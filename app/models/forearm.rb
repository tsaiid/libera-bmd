class Forearm < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  scope :pcu, -> { joins(:scan_analysis).where("wl_sched_proc_step_desc LIKE ?", "%PCU%") }

  def levels
    array = []
    array <<= {label: "RU 1/3", bone_range: "1..", area: ru13tot_area, bmc: ru13tot_bmc, bmd: ru13tot_bmd, noncollapse: true}
    array <<= {label: "RU Mid", bone_range: ".2.", area: rumidtot_area, bmc: rumidtot_bmc, bmd: rumidtot_bmd}
    array <<= {label: "RU UD", bone_range: "..3", area: ruudtot_area, bmc: ruudtot_bmc, bmd: ruudtot_bmd}
    array <<= {label: "Total", bone_range: "123", area: rutot_area, bmc: rutot_bmc, bmd: rutot_bmd}

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
    level = calculate_t_z_scores({label: "RU 1/3", bone_range: "1..", area: ru13tot_area, bmc: ru13tot_bmc, bmd: ru13tot_bmd})
    level[:t_score].round_for_report(1)
  end

  def z_score
    level = calculate_t_z_scores({label: "RU 1/3", bone_range: "1..", area: ru13tot_area, bmc: ru13tot_bmc, bmd: ru13tot_bmd})
    level[:z_score].round_for_report(1)
  end

  def report_str
    level = calculate_t_z_scores({label: "RU 1/3", bone_range: "1..", area: ru13tot_area, bmc: ru13tot_bmc, bmd: ru13tot_bmd})
    str = "The BMD of #{side} 1/3 forearm is #{level[:bmd].round_for_report(3)} gm/cm2"
    case scan_analysis.t_or_z
    when 't'
      str += ", about #{level[:peak_reference].round_for_report(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round_for_report(1)})."
    when 'z'
      str += ", the age matched percentage was about #{level[:age_matched].round_for_report(0)}\% (Z-score = #{level[:z_score].round_for_report(1)})."
    end
    str
  end

  def side
    case scan_analysis.scan_type
    when 6
      "left"
    when 7
      "right"
    else
      nil
    end
  end

  def side_abbr
    case scan_analysis.scan_type
    when 6
      '<button type="button" class="btn btn-default btn-xs" disabled="disabled">Ｌ</button>'
    when 7
      '<button type="button" class="btn btn-default btn-xs" disabled="disabled">Ｒ</button>'
    else
      nil
    end
  end

end
