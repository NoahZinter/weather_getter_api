source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'figaro'
gem 'faraday'

group :development, :test do
  gem 'pry'
  gem 'simplecov'
  gem 'jsonapi-serializer'
  gem 'rubocop-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
