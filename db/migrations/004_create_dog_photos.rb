Sequel.migration do
  change do
    create_table(:dog_photos) do
      primary_key :id

      foreign_key :dog_id, :dogs,
        null: false

      column :created_at,
        "timestamp without time zone",
        null: false

      column :updated_at,
        "timestamp without time zone",
        null: false

      column :url,
        "text",
        null: false

      column :version_name,
        "text",
        null: false
    end
  end
end
