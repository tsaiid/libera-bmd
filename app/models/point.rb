class Point < ActiveRecord::Base
  belongs_to :ReferenceCurve, foreign_key: "unique_id"

  def age
    read_attribute(:x_value)
  end

  def bmd
    read_attribute(:y_value)
  end

  def std
    read_attribute(:std)
  end
end
