require 'models/dog'

# Maps Dog models to and from a database.
class DogMapper
  def initialize(database)
    @database = database
  end

  def insert(dog)
    now = Time.now

    dog.id = dataset.insert(name: dog.name,
                            breed: dog.breed,
                            age: dog.age,
                            size: dog.size,
                            gender: dog.gender,
                            location: dog.location,
                            vaccinated: dog.vaccinated?,
                            desexed: dog.desexed?,
                            rescued: dog.rescued?,
                            created_at: now,
                            updated_at: now)

    dog
  end

  def find_by_id(id)
    row = dataset[id: id]
    Dog.new(row)
  end

  def all
    rows = dataset.all
    rows.map { |row| Dog.new(row) }
  end

  private

  def dataset
    @database[:dogs]
  end
end
