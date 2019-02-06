class VolounteerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :groups
end
