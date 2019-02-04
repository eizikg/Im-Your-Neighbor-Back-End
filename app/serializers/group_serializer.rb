class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :volounteers, :events
  def volounteers
    self.object.volounteers.map do |volounteer|
      {first_name: volounteer.first_name,
       last_name: volounteer.last_name,
       username: volounteer.username
     }
     end
    end
end
