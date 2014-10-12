Sequel.migration do
  change do
    create_table(:dogs) do
      primary_key :id

      column :created_at,
        "timestamp without time zone",
        null: false

      column :updated_at,
        "timestamp without time zone",
        null: false

      column :name,
        "text",
        null: false

      column :breed,
        "text",
        null: false
    end
  end
end
