Sequel.migration do
  change do
    alter_table(:dogs) do
      drop_column :photo_url
    end
  end
end
