class Booking < ApplicationRecord
  belongs_to :band
  belongs_to :event
  has_one :rating
end
