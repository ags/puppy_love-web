require 'oat'
require 'oat/adapters/hal'

class DogSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    link :self, href: "/api/dogs/#{item.id}"

    properties do |props|
      props.name item.name
      props.breed item.breed
    end
  end
end
