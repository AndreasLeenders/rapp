class Event < ApplicationRecord
  belongs_to :organiser
  has_many :categories, through :event_category
  has_many :bookings
end
