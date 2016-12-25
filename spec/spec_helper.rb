require "simplecov"

SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/spec/"
end

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb", __FILE__)

require "rspec/rails"
require "factory_girl"
require "factories"
require "capybara/rspec"
require "database_cleaner"

RSpec.configure do |config|
  config.include OkuribitoRails::Engine.routes.url_helpers
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
