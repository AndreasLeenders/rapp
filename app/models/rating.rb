class Rating < ApplicationRecord
  belongs_to :organiser, through: event
  belongs_to :band
end
