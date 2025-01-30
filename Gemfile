# frozen_string_literal: true

source 'https://rubygems.org'

ruby file: ".ruby-version"

gem 'rails', '~> 7.1.2'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3.0'
gem 'dartsass-sprockets'
gem 'importmap-rails'
gem 'lookbook'
gem 'puma', '>= 5.0'
gem 'redis', '>= 4.0.1'
gem 'renuocop'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'brakeman', require: false
  gem 'erb_lint', require: false
end

group :development do
  gem 'rack-mini-profiler'
  gem 'web-console'
  gem 'listen'
  gem 'actioncable'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
