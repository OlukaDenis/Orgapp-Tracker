source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'bootstrap', '4.4.1'
gem 'font-awesome-rails', '4.7.0.5'
gem 'jquery-rails', '4.3.5'
gem 'popper_js', '~> 1.16.0'
gem 'rails-ujs', '0.1.0'
gem 'sprockets-rails', '3.2.1'
gem 'will_paginate-bootstrap4', '0.2.2'

gem 'carrierwave'
gem 'mini_magick', '4.9.5'

gem 'rubocop'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner', '1.8.2'
  gem 'rspec-rails', '3.9.0'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '4.3.0'
  gem 'webdrivers'
end

group :production do
  gem 'fog', '1.42'
  gem 'pg', '1.2.2'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
