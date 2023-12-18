source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.1.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'rubocop'
gem "rubocop-rails", "~> 2.23"
gem "rubocop-rspec", "~> 2.25"

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails', '~> 6.4.2'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'faker'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
end
