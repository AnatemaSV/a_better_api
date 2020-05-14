# frozen_string_literal: true

namespace :db do
  desc 'Truncate all tables, except schema_migrations (customizable)'
  task :truncate, [:tables] => 'db:load_config' do |_t, args|
    args.with_defaults(tables: 'schema_migrations')

    skipped = args[:tables].split(' ')
    config  = ActiveRecord::Base.configurations[::Rails.env]

    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection.tables.each do |table|
      next if skipped.include?(table)

      query = "TRUNCATE #{table} RESTART IDENTITY CASCADE"
      puts query
      ActiveRecord::Base.connection.execute(query)
    end
  end
end
