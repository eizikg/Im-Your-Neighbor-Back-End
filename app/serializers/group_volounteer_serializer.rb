class GroupVolounteerSerializer < ActiveModel::Serializer
  attributes :is_admin, :volounteer
  def volounteer
    {first_name: volounteer.first_name,
    id: volounteer.id,
    last_name: volounteer.last_name,
    username: volounteer.username}
  end
end
