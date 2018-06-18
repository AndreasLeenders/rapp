class Booking < ApplicationRecord
  belongs_to :band
  belongs_to :organiser, through: :events
end
