class RestaurantSerializer
  include JSONAPI::Serializer

  attributes :name, :cuisine, :hours, :id
end