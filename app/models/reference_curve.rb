class ReferenceCurve < ActiveRecord::Base
  self.primary_key = "unique_id"

  has_many :points, foreign_key: :unique_id

  def lower_point(age)
    points.where("x_value <= " + age.to_s).order(x_value: :desc).first
  end

  def upper_point(age)
    points.where("x_value >= " + age.to_s).order(x_value: :asc).first
  end

  def t_score(bmd)
    age = read_attribute(:age_young).to_i
    p = points.where(x_value: age).first
    (bmd - p.bmd) / p.std
  end

  def peak_reference(bmd)
    age = read_attribute(:age_young).to_i
    p = points.where(x_value: age).first
    (bmd / p.bmd) * 100
  end

  def z_score(pt_age, bmd)
    ref = calculate_ref(pt_age)
    (bmd - ref[:bmd]) / ref[:std]
  end

  def age_matched(pt_age, bmd)
    ref = calculate_ref(pt_age)
    (bmd / ref[:bmd]) * 100
  end

  def x_values
    points.select(:x_value).map {|p| p.x_value}
  end

  def y_values
    points.select(:y_value).map {|p| p.y_value}
  end

  def stds
    points.select(:std).map {|p| p.std}
  end

  def regress x, y, degree
    require 'matrix'

    x_data = x.map { |xi| (0..degree).map { |pow| (xi**pow).to_f } }

    mx = Matrix[*x_data]
    my = Matrix.column_vector(y)

    ((mx.t * mx).inv * mx.t * my).transpose.to_a[0]
  end

  def curve_fit polynom, x
    degree = polynom.size - 1
    (0..degree).inject(0) {|sum, i| sum + polynom[i] * x**i}
  end

#  private
#  temp comment out for debug
  def calculate_ref(pt_age)
    up = upper_point(pt_age)
    lp = lower_point(pt_age)
    # should handle with: if upper == lower
    if (up == lp)
      ref_bmd = up.bmd
      ref_std = up.std
    # should handle with: very old patients
    elsif (up.nil?)
      lp2 = lower_point(lp.age - 1)
      slope = (pt_age - lp.age) / (lp.age - lp2.age)
      ref_bmd = slope * (lp.bmd - lp2.bmd) + lp.bmd
      ref_std = slope * (lp.std - lp2.std) + lp.std
    else
      ref_bmd = ((pt_age - lp.age) / (up.age - lp.age)) * (up.bmd - lp.bmd) + lp.bmd
      ref_std = ((pt_age - lp.age) / (up.age - lp.age)) * (up.std - lp.std) + lp.std
    end
=begin
    cf_bmd = curve_fit(regress(x_values, y_values, 1), pt_age)
    cf_std = curve_fit(regress(x_values, stds, 1), pt_age)
=end
    {bmd: ref_bmd, std: ref_std}
  end
end
