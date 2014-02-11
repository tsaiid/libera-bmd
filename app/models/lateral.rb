class Lateral < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  include SpineGeneral

  def levels
    array = []
    array <<= {label: "L1", bone_range: "1...", bmd: l1_bmd, vbmd: l1_vbmd} if l1_included?
    array <<= {label: "L2", bone_range: ".2..", bmd: l2_bmd, vbmd: l2_vbmd} if l2_included?
    array <<= {label: "L3", bone_range: "..3.", bmd: l3_bmd, vbmd: l3_vbmd} if l3_included?
    array <<= {label: "L4", bone_range: "...4", bmd: l4_bmd, vbmd: l4_vbmd} if l4_included?
    array <<= {label: "Total", bone_range: bone_range, bmd: ltot_bmd, vbmd: ltot_vbmd}

    ## calculate T- and Z-scores
    array.each do |a|
      a = calculate_t_z_scores(a)
    end
  end

  def t_score
    level = calculate_t_z_scores({label: "Total", bone_range: bone_range, bmd: ltot_bmd, vbmd: ltot_vbmd})
    level[:t_score].round_for_report(1)
  end

  def z_score
    level = calculate_t_z_scores({label: "Total", bone_range: bone_range, bmd: ltot_bmd, vbmd: ltot_vbmd})
    level[:z_score].round_for_report(1)
  end

  def report_str
    level = calculate_t_z_scores({label: "Total", bone_range: bone_range, bmd: ltot_bmd, vbmd: ltot_vbmd})
    str = "Average bone mineral density (BMD) of L1 to L4 is #{level[:bmd].round_for_report(3)} gm/cm2"
    case scan_analysis.t_or_z
    when 't'
      str += ", about #{level[:peak_reference].round_for_report(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round_for_report(1)})."
    when 'z'
      str += ". The age matched percentage is about #{level[:age_matched].round_for_report(0)}\% (Z-score = #{level[:z_score].round_for_report(1)})."
    end
    str
  end
end
