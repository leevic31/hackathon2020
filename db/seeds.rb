# this will import the sql files into the tables.
unless Rails.env.production?
  connection = ActiveRecord::Base.connection
  connection.tables.each do |table|
    connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
  end
  paths = %w[db/country_temps-dump.sql db/state_temps-dump.sql]

  ActiveRecord::Base.transaction do
    paths.each do |path|
      file = File.read(path)
      connection.execute(file)
    end
  end
end
