class Event < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :city, presence: true
  validates :name, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true



  belongs_to :organiser
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :bookings, dependent: :destroy
end
