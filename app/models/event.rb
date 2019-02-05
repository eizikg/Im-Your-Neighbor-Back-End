require 'pry'
class Event < ApplicationRecord
  belongs_to :group
  has_many :event_volounteers

  # validate :is_admin



  private

  # def is_admin
  #   binding.pry
  #   current_group = Group.find(group_id).volounteers
  #   if current_group.volounteers.include(current_user)
  #   end
end
