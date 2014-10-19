Sequel.migration do
  change do
    alter_table(:dogs) do
      add_column :size,
        "text",
        null: false

      add_column :gender,
        "text",
        null: false

      add_column :age,
        "text",
        null: false

      add_column :location,
        "text",
        null: false

      add_column :vaccinated,
        "boolean",
        null: false

      add_column :desexed,
        :boolean,
        null: false

      add_column :rescued,
        :boolean,
        null: false

      add_column :photo_url,
        :text,
        null: true
    end
  end
end
