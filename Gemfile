# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in active-dbml.gemspec
gemspec

version = ENV['AR_VERSION'].to_f

mysql2_version  = '0.3.0'
mysql2_version  = '0.4.0' if version >= 4.2
mysql2_version  = '0.5.0' if version >= 6.1
sqlite3_version = '1.3.0'
sqlite3_version = '1.4.0' if version >= 6.0
pg_version      = '0.9'
pg_version      = '1.1' if version >= 6.1

group :development, :test do
  gem 'rubocop'
  gem 'rake'
  gem 'rspec'
end

# Database Adapters
gem "mysql2",                 "~> #{mysql2_version}"
gem "pg",                     "~> #{pg_version}"
gem "sqlite3",                "~> #{sqlite3_version}"
# seamless_database_pool requires Ruby ~> 2.0
gem "seamless_database_pool", "~> 1.0.20" if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.0.0')
gem "trilogy" if version >= 6.0
if version >= 6.0 && version <= 7.0
  gem "activerecord-trilogy-adapter"
end

if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.0.0")
  gem "factory_bot"
else
  gem "factory_bot", "~> 5", "< 6.4.5"
end

gem 'rails-erd'
gem "pry-byebug"
gem "pry", "~> 0.14.0"
