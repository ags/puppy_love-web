require 'oat'
require 'oat/adapters/hal'

# Serializes a Dog model to HAL JSON.
class DogSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    link :self, href: "/api/dogs/#{item.id}"

    properties do |props|
      props.name item.name
      props.breed item.breed
      props.size item.size
      props.gender item.gender
      props.age item.age
      props.location item.location
      props.vaccinated item.vaccinated
      props.desexed item.desexed
      props.rescued item.rescued
      props.photo_url item.photo_url
    end
  end
end
