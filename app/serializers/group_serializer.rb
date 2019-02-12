class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :group_volounteers, :events
  has_many :group_volounteers , serializer: GroupVolounteerSerializer
  # has_many :volounteers, serializer: VolounteerSerializer

  # def volounteers
  #   self.object.volounteers.map do |volounteer|
  #     {first_name: volounteer.first_name,
  #      id: volounteer.id,
  #      last_name: volounteer.last_name,
  #      username: volounteer.username,
  #      is_admin: volounteer.group_volounteers.where(group_id: self.object.id)[0].is_admin
  #    }
  #    end
    end
