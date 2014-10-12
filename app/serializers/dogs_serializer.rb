require 'oat'
require 'oat/adapters/hal'
require 'serializers/dog_serializer'

# Serializes a collection of Dog models to HAL JSON.
class DogsSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    link :self, href: "/api/dogs"

    property :total, item.size

    entities :dogs, item, DogSerializer
  end
end
