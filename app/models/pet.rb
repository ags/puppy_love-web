require 'virtus'

class Pet
  include Virtus.model

  attribute :id,    Integer
  attribute :name,  String
  attribute :breed, String
end
