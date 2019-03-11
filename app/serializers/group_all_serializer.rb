class GroupAllSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :volounteers_count, :room_id, :neighborhood
  def volounteers_count
   self.object.volounteers.count
    end
end
