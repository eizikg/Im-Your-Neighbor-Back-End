class GroupVolounteerSerializer < ActiveModel::Serializer
  attributes :volounteer, :is_admin
  def volounteer
    volounteer = self.object.volounteer
    {first_name: volounteer.first_name,
    last_name: volounteer.last_name,
    email: volounteer.email,
    id: volounteer.id
    }
  end
end
