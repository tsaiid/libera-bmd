class Point < ActiveRecord::Base
  belongs_to :ReferenceCurve, foreign_key: "UNIQUE_ID"

  def age
    read_attribute(:X_VALUE)
  end

  def bmd
    read_attribute(:Y_VALUE)
  end

  def std
    read_attribute(:STD)
  end
end
