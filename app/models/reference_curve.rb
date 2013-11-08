class ReferenceCurve < ActiveRecord::Base
  self.primary_key = "UNIQUE_ID"

  has_many :Points, foreign_key: :UNIQUE_ID

  def lower_point(age)
    self.Points.where("X_VALUE <= " + age.to_s).order(X_VALUE: :desc).first
  end

  def upper_point(age)
    self.Points.where("X_VALUE >= " + age.to_s).order(X_VALUE: :asc).first
  end

  def t_score(pt_age, bmd)
    up = self.upper_point(pt_age)
    lp = self.lower_point(pt_age)
    ref_bmd = ((pt_age - lp.age) / (up.age - lp.age)) * (up.bmd - lp.bmd) + lp.bmd
    ref_std = ((pt_age - lp.age) / (up.age - lp.age)) * (up.std - lp.std) + lp.std
    (bmd - ref_bmd) / ref_std
  end
end
