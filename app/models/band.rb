class Band < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :bookings
  has_many :band_categories
  has_many :categories, through: :band_categories

  end
