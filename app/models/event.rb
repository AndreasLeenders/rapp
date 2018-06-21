class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :city, presence: true
  belongs_to :organiser
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :bookings
end
