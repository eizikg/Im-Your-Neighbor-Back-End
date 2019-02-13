class Group < ApplicationRecord
  acts_as_mappable
  has_many :group_volounteers
  has_many :volounteers, through: :group_volounteers
  has_many :events
end
