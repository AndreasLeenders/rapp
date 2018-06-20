class Rating < ApplicationRecord
  belongs_to :event
  belongs_to :band
end
