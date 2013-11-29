class Lateral < ActiveRecord::Base
  belongs_to :patient, foreign_key: "patient_key"
  belongs_to :scan_analysis, foreign_key: "scanid"

  def bone_range
    range = ""
    range += l1_included? ? "1" : "."
    range += l2_included? ? "2" : "."
    range += l3_included? ? "3" : "."
    range += l4_included? ? "4" : "."
  end
end
