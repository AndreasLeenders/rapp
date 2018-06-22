class Rating < ApplicationRecord
  belongs_to :booking
  validates :stars, inclusion: { in: 0..5 }

end
