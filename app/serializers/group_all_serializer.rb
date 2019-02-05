class GroupAllSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :volounteers_count
  def volounteers_count
   self.object.volounteers.count
    end
end
