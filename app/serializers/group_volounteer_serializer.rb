class GroupVolounteerSerializer < ActiveModel::Serializer
  attributes :volounteer
  def volounteer
    volounteer = self.object.volounteer
    {first_name: volounteer.first_name,
    last_name: volounteer.last_name,
    email: volounteer.email,
    id: volounteer.id,
    is_admin: self.object.is_admin
    }
  end
end
