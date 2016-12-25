$:.push File.expand_path("../lib", __FILE__)

require "okuribito_rails/version"

Gem::Specification.new do |s|
  s.name        = "okuribito_rails"
  s.version     = OkuribitoRails::VERSION
  s.authors     = ["Yasuhiro Matsumura"]
  s.email       = ["ym.contributor@gmail.com"]
  s.homepage    = "https://github.com/muramurasan/okuribito_rails"
  s.summary     = "OkuribitoRails is an engine for Rails that aims to manage method call status. And you can identify uncalled methods."
  s.description = "OkuribitoRails is an engine for Rails that aims to manage method call status. And you can identify uncalled methods."

  s.files = Dir["{app,db,lib}/**/*", "config/routes.rb", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "okuribito"
  s.add_dependency "rails", ['>= 4.0', '< 6']
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "codeclimate-test-reporter", "~> 1.0.0"
end
