class Point < ActiveRecord::Base
  belongs_to :ReferenceCurve, foreign_key: "UNIQUE_ID"
end
