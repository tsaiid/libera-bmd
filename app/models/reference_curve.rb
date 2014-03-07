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
    if (p)
      if (p.l_value == 1)
        (bmd - p.bmd) / p.std
      else
        (p.bmd * ((bmd / p.bmd) ** p.l_value - 1)) / (p.l_value * p.std)
      end
    else # 可能在 age_young 沒有設定 point, 直接傳回 age_young 的 Z score
      z_score(age, bmd)
    end
  end

  def peak_reference(bmd)
    age = read_attribute(:age_young).to_i
    p = points.where(x_value: age).first
    if (p)
      (bmd / p.bmd) * 100
    else # 可能在 age_young 沒有設定 point, 直接傳回 age_young 的 age matched
      age_matched(age, bmd)
    end
  end

  def z_score(pt_age, bmd)
    ref = calculate_ref(pt_age)
    if (ref[:l] == 1)
      (bmd - ref[:bmd]) / ref[:std]
    else
      (ref[:bmd] * ((bmd / ref[:bmd]) ** ref[:l] - 1)) / (ref[:l] * ref[:std])
    end
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

#  private
#  temp comment out for debug
  ## 以內插法計算
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
      ref_l = slope * (lp.l_value - lp2.l_value) + lp.l_value
    else
      ref_bmd = ((pt_age - lp.age) / (up.age - lp.age)) * (up.bmd - lp.bmd) + lp.bmd
      ref_std = ((pt_age - lp.age) / (up.age - lp.age)) * (up.std - lp.std) + lp.std
      ref_l = ((pt_age - lp.age) / (up.age - lp.age)) * (up.l_value - lp.l_value) + lp.l_value
    end

    {bmd: ref_bmd, std: ref_std, l: ref_l}
  end
end
