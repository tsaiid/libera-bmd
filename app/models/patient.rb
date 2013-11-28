class Patient < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :last_name

  self.primary_key = "patient_key"
  self.per_page = 15

  scope :not_phantom, -> {
    where('phantom_id IS NULL').
    where('identifier1 IS NOT NULL')
  }
  scope :lists, -> {
    not_phantom.
    select("last_name,
            identifier1").
    group(:identifier1).
    order(identifier1: :asc)
  }

  has_many :forearms, foreign_key: "patient_key"
  has_many :spines, foreign_key: "patient_key"
  has_many :hips, foreign_key: "patient_key"
  has_many :hip_hsas, foreign_key: "patient_key"
  has_many :laterals, foreign_key: "patient_key"
  has_many :scan_analyses, foreign_key: "patient_key"

  def name
    read_attribute(:last_name)
  end

  def birthday
    read_attribute(:birthdate)
  end

  def pid
    read_attribute(:identifier1)
  end

  def studies
    self.scan_analyses.group(:accession_no)
  end

  def studies_by_acc(accession_no)
    self.scan_analyses.where(accession_no: accession_no)
  end

  def spines_by_acc(accession_no)
    self.scan_analyses.where(accession_no: accession_no, ref_type: "S")
  end

  def hips_by_acc(accession_no)
    self.scan_analyses.where(accession_no: accession_no, ref_type: "H")
  end

  def forearms_by_acc(accession_no)
    self.scan_analyses.where(accession_no: accession_no, ref_type: "R")
  end

  def status_by_acc(accession_no)
    scores = []
    studies = self.studies_by_acc(accession_no)
    studies.each do |study|
      scores << study.score
    end

    case studies.first.t_or_z
    when 't'
      if scores.min <= -2.5
        "osteoporosis"
      elsif scores.min < -1.0
        "osteopenia"
      else
        "normal"
      end
    when 'z'
      if scores.min < 2
        "normal"
      else
        "below"
      end
    end
  end

  def status_to_icon(status)
    icon, style = case status
                  when 'osteoporosis'
                    ["remove", "danger"]
                  when 'osteopenia'
                    ["flag", "warning"]
                  when 'below'
                    ["minus", "warning"]
                  when 'normal'
                    ["ok", "success"]
                  end

    "<button type=\"button\" class=\"btn btn-#{style} btn-xs\">
      <span class=\"glyphicon glyphicon-#{icon}\"></span>
    </button>"
  end

  def ethnicity
    read_attribute(:ethnicity)
  end

  def sex
    read_attribute(:sex)
  end

  ## use last_update for age calculation.
  def age(time = self.read_attribute(:last_update))
    time = time.to_datetime
    dob = self.birthday
    time.year - dob.year - ((time.month > dob.month || (time.month == dob.month && time.day >= dob.day)) ? 0 : 1)
  end

  def menopause_year
    mp_year = read_attribute(:menopause_year)
    mp_year > 0 ? mp_year : ""
  end
end
