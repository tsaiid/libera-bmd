class ReferenceCurve < ActiveRecord::Base
  self.primary_key = "UNIQUE_ID"

  has_many :Points, foreign_key: :UNIQUE_ID
end
