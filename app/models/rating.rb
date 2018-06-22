class Rating < ApplicationRecord
  belongs_to :event
  belongs_to :band
  validates :rating, inclusion: { in: 0..5 }
end
