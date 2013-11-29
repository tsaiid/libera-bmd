class Spine < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  scope :pcu, -> { joins(:scan_analysis).where("wl_sched_proc_step_desc LIKE ?", "%PCU%") }

  def bone_range
    range = ""
    range += l1_included? ? "1" : "."
    range += l2_included? ? "2" : "."
    range += l3_included? ? "3" : "."
    range += l4_included? ? "4" : "."
  end

  def levels
    array = []
    array <<= {label: "L1", bone_range: "1...", area: self.l1_area, bmc: self.l1_bmc, bmd: self.l1_bmd} if read_attribute(:l1_included)
    array <<= {label: "L2", bone_range: ".2..", area: self.l2_area, bmc: self.l2_bmc, bmd: self.l2_bmd} if read_attribute(:l2_included)
    array <<= {label: "L3", bone_range: "..3.", area: self.l3_area, bmc: self.l3_bmc, bmd: self.l3_bmd} if read_attribute(:l3_included)
    array <<= {label: "L4", bone_range: "...4", area: self.l4_area, bmc: self.l4_bmc, bmd: self.l4_bmd} if read_attribute(:l4_included)
    array <<= {label: "Total", bone_range: "1234", area: self.tot_area, bmc: self.tot_bmc, bmd: self.tot_bmd}

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
    level = calculate_t_z_scores({label: "Total", bone_range: "1234", area: self.tot_area, bmc: self.tot_bmc, bmd: self.tot_bmd})
    level[:t_score].round(1)
  end

  def z_score
    level = calculate_t_z_scores({label: "Total", bone_range: "1234", area: self.tot_area, bmc: self.tot_bmc, bmd: self.tot_bmd})
    level[:z_score].round(1)
  end

  def report_str
    level = calculate_t_z_scores({label: "Total", bone_range: "1234", area: self.tot_area, bmc: self.tot_bmc, bmd: self.tot_bmd})
    str = "Average bone mineral density (BMD) of L1 to L4 is #{level[:bmd].round(3)} gm/cm2"
    case self.scan_analysis.t_or_z
    when 't'
      str += ", about #{level[:peak_reference].round(0)}\% of the mean of young reference value (T-score = #{level[:t_score].round(1)})."
    when 'z'
      str += ". The age matched percentage is about #{level[:age_matched].round(0)}\% (Z-score = #{level[:z_score].round(1)})."
    end
    str
  end

  def l1_included?
    !read_attribute(:l1_included).zero?
  end

  def l2_included?
    !read_attribute(:l2_included).zero?
  end

  def l3_included?
    !read_attribute(:l3_included).zero?
  end

  def l4_included?
    !read_attribute(:l4_included).zero?
  end
end
