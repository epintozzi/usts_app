source 'https://rubygems.org'
ruby "2.7.6"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'devise', '>= 4.7.1'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'cancancan', '~> 1.10'
gem "paperclip", "~> 5.2.0"
gem "figaro"
gem 'aws-sdk', '~> 2.3'
gem 'paranoia', '~> 2.2'
gem 'newrelic_rpm'
gem 'concurrent-ruby', '1.3.4'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'rspec-rails'
  gem 'capybara', '~> 2.18.0'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'faker'
  gem 'simplecov', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
