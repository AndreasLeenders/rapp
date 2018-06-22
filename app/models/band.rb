class Band < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :location, presence: true
  validates :content, presence: true
  validates :soundcloud, presence: true



  belongs_to :user
  has_many :ratings
  has_many :bookings
  has_many :band_categories
  has_many :categories, through: :band_categories

  end
