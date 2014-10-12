require 'virtus'

# Models the attributes of a dog.
class Dog
  include Virtus.model

  attribute :id,    Integer
  attribute :name,  String
  attribute :breed, String
end
