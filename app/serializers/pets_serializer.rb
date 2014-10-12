require 'oat'
require 'oat/adapters/hal'
require 'serializers/pet_serializer'

class PetsSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    link :self, href: "/api/pets"

    property :total, item.size

    entities :pets, item, PetSerializer
  end
end
