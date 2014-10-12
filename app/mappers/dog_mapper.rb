class DogMapper
  def initialize(database)
    @database = database
  end

  def insert(dog)
    now = Time.now

    dog.id = dataset.insert(name: dog.name,
                            breed: dog.breed,
                            created_at: now,
                            updated_at: now)

    dog
  end

  def find_by_id(id)
    row = dataset[id: id]
    Dog.new(row)
  end

  private

  def dataset
    @database[:dogs]
  end
end
