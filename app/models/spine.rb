class Spine < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  scope :pcu, -> { joins(:scan_analysis).where("wl_sched_proc_step_desc LIKE ?", "%PCU%") }

  include SpineGeneral

  def report_str
    level = calculate_t_z_scores({label: "Total", bone_range: bone_range, area: tot_area, bmc: tot_bmc, bmd: tot_bmd})
    str = "Average bone mineral density (BMD) of #{bone_range_str} is #{level[:bmd].round_for_report(3)} gm/cm2"
    case scan_analysis.t_or_z
    when 't'
      str += ", about #{level[:peak_reference].round(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round(1)})."
    when 'z'
      str += ". The age matched percentage is about #{level[:age_matched].round(0)}\% (Z-score = #{level[:z_score].round(1)})."
    end
    str
  end
end
