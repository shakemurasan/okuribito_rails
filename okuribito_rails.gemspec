$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "okuribito_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "okuribito_rails"
  s.version     = OkuribitoRails::VERSION
  s.authors     = ["Yasuhiro Matsumura"]
  s.email       = ["ym.contributor@gmail.com"]
  s.homepage    = "https://github.com/muramurasan/okuribito_rails"
  s.summary     = "OkuribitoRails is an engine for Rails that aims to be the managing method call status."
  s.description = "OkuribitoRails is an engine for Rails that aims to be the managing method call status." \
                  "You write the method name you want to monitor in the configuration file." \
                  "OkuribitoRails detects a method call during application execution and registers the call information in the DB." \
                  "In other words, you can identify methods that have not been called from anywhere in production!"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "okuribito"
  s.add_dependency "rails", ['>= 4.0', '< 6']
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
