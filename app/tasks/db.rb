namespace :db do
  desc 'Run DB migrations'
  task :migrate => :app do
    require 'sequel/extensions/migration'

    Sequel::Migrator.apply(DB, 'db/migrations')
  end

  desc 'Drop the database'
  task :drop => :app do
    DB.tables.each do |table|
      DB.run("DROP TABLE #{table} CASCADE")
    end
  end
end
