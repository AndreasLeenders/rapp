class Category < ApplicationRecord
  has_many :event_categories
  has_many :band_categories

end
