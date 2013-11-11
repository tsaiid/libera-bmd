class ReferenceCurve < ActiveRecord::Base
  self.primary_key = "unique_id"

  has_many :Points, foreign_key: :unique_id

  def lower_point(age)
    self.Points.where("x_value <= " + age.to_s).order(x_value: :desc).first
  end

  def upper_point(age)
    self.Points.where("x_value >= " + age.to_s).order(x_value: :asc).first
  end

  def t_score(bmd)
    age = read_attribute(:age_young).to_i
    p = self.Points.where(x_value: age).first
    (bmd - p.bmd) / p.std
  end

  def z_score(pt_age, bmd)
    up = self.upper_point(pt_age)
    lp = self.lower_point(pt_age)
    ref_bmd = ((pt_age - lp.age) / (up.age - lp.age)) * (up.bmd - lp.bmd) + lp.bmd
    ref_std = ((pt_age - lp.age) / (up.age - lp.age)) * (up.std - lp.std) + lp.std
    (bmd - ref_bmd) / ref_std
  end
end
