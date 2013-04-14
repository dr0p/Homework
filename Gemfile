source 'https://rubygems.org'
gem 'rails'
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end
gem 'jquery-rails'
gem "haml"
gem "haml-rails", :group => :development
gem "bootstrap-sass"

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'factory_girl_rails'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'sqlite3'
end

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'librarian', '>= 0.0.25', require: false
  gem 'pry-rails'
  gem 'libnotify'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
end

