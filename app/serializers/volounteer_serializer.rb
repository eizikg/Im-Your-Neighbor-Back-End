class VolounteerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :groups, :lat, :lng, :address


  def volounteers_count
   self.object.volounteers.count
  end

  def groups
    @groups = self.object.groups.map do |group|
      {id: group.id, description: group.description, name: group.name, volounteers_count: group.volounteers.count}
    end
    @groups
  end

end
