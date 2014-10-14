require 'mappers/dog_mapper'

module PuppyLove
  def self.dog_mapper
    @_dog_mapper ||= DogMapper.new(DB)
  end
end
