class BandCategory < ApplicationRecord
  has_many :categories
  belongs_to :band
end
