class Band < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :bookings
  has_many :categories, through: :band_category

  validates :name, presence: true
  validates :location, presence: true
end
