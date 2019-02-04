class Event < ApplicationRecord
  belongs_to :group
  has_many :event_volounteers
end
