class FavoriteSerializer
  include JSONAPI::Serializer

  attributes :email, :party_size, :time
end