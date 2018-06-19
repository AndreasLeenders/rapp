class Organiser < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :bookings, through: :events
end
