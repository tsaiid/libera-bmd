class ScanAnalysis < ActiveRecord::Base
  self.primary_key = "scanid"
  self.per_page = 15

  belongs_to :patient, foreign_key: "patient_key"

  has_one :hip, foreign_key: :scanid
  has_one :spine, foreign_key: :scanid
  has_one :forearm, foreign_key: :scanid
  has_one :lateral, foreign_key: :scanid
  has_one :w_body, foreign_key: :scanid

  scope :effective, -> {
    joins(:patient).
    where("patients.identifier1 IS NOT NULL").
    where("patients.last_name IS NOT NULL")
  }

  scope :accession_lists, -> {
    effective.
    group(:accession_no).
    order(scan_date: :desc)
  }

  scope :pcu_acc_list, -> {
    effective.
    group(:accession_no).
    where("wl_sched_proc_step_desc LIKE ?", "%PCU%").
    order(scan_date: :asc)
  }

  scope :pcu_list, -> {
    effective.
    where("wl_sched_proc_step_desc LIKE ?", "%PCU%").
    order(scan_date: :asc)
  }

  def exam
    case type
    when "S"
      spine
    when "H"
      hip
    when "R"
      forearm
    when "L"
      lateral
    when "W"
      w_body
    else
      nil
    end
  end

  # decide to use T or Z score according to age > 50 or menopaused.
  def t_or_z
    age = patient.age(scan_date)
    sex = patient.sex
    mp_age = patient.menopause_year.to_i
    ## 依規定，停經後婦女及大於 50 歲之男性才適用 T-score，但有可能放射師沒有輸入停經年齡，所以必須額外加入條件
    ((sex == "F" && (age > 55  || mp_age > 0)) || (age > 50 && sex == "M")) ? "t" : "z"
  end

  # find score for conclusion
  def score
    case t_or_z
    when 't'
      exam.t_score
    when 'z'
      exam.z_score
    end
  end

  def find_reference(bone_range="")
    ref_type = type
    ethnicity = patient.ethnicity
    sex = patient.sex
    # 暫時不要對 bone_range 做預設處理
    #bone_range = exam.bone_range if bone_range.empty?
    # 先以找到 ref_curve 為主，確定有之後再往下細找
    # 至少一定要符合的條件是 reftype, sex, bonerange
    rc = ReferenceCurve.where(  reftype: ref_type,
                                sex: sex,
                                bonerange: bone_range  )

    if (rc.size > 1)
      next_rc = rc.where( ethnic: (["R", "L", "W"].include?(ref_type) ? nil : ethnicity) )

      if (next_rc.size >= 1)
        rc = next_rc
      end

      if (next_rc.size > 1)
        next_rc = rc.where( if_current: 1 )

        if (next_rc.size >= 1)
          rc = next_rc
        end
      end
    end

    rc.last
  end

  def type
    ref_type || (spine ? "S" :
                (hip ? "H" :
                (forearm ? "R" :
                (lateral ? "L" :
                (w_body ? "W" :
                nil)))))
  end

  def scan_type
    read_attribute(:scan_type)
  end

  def to_s
    case type
    when "S"
      "Spine"
    when "H"
      "Hip - " + exam.side.capitalize
    when "R"
      "Forearm - " + exam.side.capitalize
    when "L"
      "Lateral Spine"
    else
      nil
    end
  end

  def accession_no
    read_attribute(:accession_no)
  end

  def scan_date
    read_attribute(:scan_date)
  end
end
