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
