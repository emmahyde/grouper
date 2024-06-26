source 'https://rubygems.org'

ruby '3.2.3'

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

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production + to support Turbo
gem 'redis', '>= 4.0.1'
gem 'redis-rails'

# strong_parameters typed replacement
# gem 'typed_params'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# bcrypt for password hashing
gem 'bcrypt', '~> 3.1.7'

# kaminari for "pagination" in our endless scroll
gem 'kaminari'

# safety for production migrations!
gem 'strong_migrations'

# ActiveStorage image variants
gem 'image_processing', '>= 1.2'

gem 'aws-sdk-s3', require: false

# View Component for reusable components
gem 'view_component', '~> 3.11'

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails', '~> 6.4.2'
  gem 'faker'
  gem 'rspec-rails', '~> 6.1.0'
end

group :development do
  gem 'active_record_doctor'
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'hotwire-livereload', '~> 1.3'
  gem 'yard', '~> 0.9.34', require: false
end

group :test, :development do
  gem 'bullet', '~> 7.1'
  gem 'dotenv', '~> 3.0'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
