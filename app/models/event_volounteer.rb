class EventVolounteer < ApplicationRecord
  belongs_to :event

  validates :volounteer_id, presence: true
  validates :group_id, presence: true
  validates :event_id, presence: true
end
