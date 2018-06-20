class BandCategory < ApplicationRecord
  belongs_to :category
  belongs_to :band
end
