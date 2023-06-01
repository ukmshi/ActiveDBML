require 'active/dbml'

namespace :active_dbml do
  desc 'Export DBML'
  task :export, [:export_path] => :environment do |t, args|
    args.with_defaults(export_path: 'db/export.dbml')
    Active::Dbml.export_dbml(args['export_path'])
    puts "📣 Successfully exported DBML to #{args['export_path']}!"
  end
end
