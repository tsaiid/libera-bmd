class ReferenceCurve < ActiveRecord::Base
  self.primary_key = "UNIQUE_ID"

  has_many :Points, foreign_key: :UNIQUE_ID

  def lower_point(age)
    self.Points.where("X_VALUE <= " + age.to_s).order(X_VALUE: :desc).first
  end

  def upper_point(age)
    self.Points.where("X_VALUE >= " + age.to_s).order(X_VALUE: :asc).first
  end
end
