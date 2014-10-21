require 'virtus'

# Models the attributes of a dog.
class Dog
  include Virtus.model

  attribute :id,          Integer
  attribute :name,        String
  attribute :breed,       String
  attribute :size,        String
  attribute :gender,      String
  attribute :age,         String
  attribute :location,    String
  attribute :vaccinated,  Boolean
  attribute :desexed,     Boolean
  attribute :rescued,     Boolean
end
