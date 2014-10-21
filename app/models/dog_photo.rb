class DogPhoto
  include Virtus.model

  attribute :id, Integer
  attribute :dog
  attribute :url, String
  attribute :version_name, String
end
