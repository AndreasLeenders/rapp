class Event < ApplicationRecord
  belongs_to :organiser
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :bookings
end
