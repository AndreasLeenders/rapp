class EventCategory < ApplicationRecord
  has_many :categories
  belongs_to :event
end
