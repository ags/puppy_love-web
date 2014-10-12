require 'oat'
require 'oat/adapters/hal'

class PetSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    link :self, href: "/api/pets/#{item.id}"

    properties do |props|
      props.name item.name
      props.breed item.breed
    end
  end
end
