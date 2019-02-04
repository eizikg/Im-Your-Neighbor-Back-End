class Group < ApplicationRecord
  has_many :group_volounteers
  has_many :volounteers, through: :group_volounteers
  has_many :events
  belongs_to :neighborhood
end
