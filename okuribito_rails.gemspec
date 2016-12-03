$:.push File.expand_path("../lib", __FILE__)

require "okuribito_rails/version"

Gem::Specification.new do |s|
  s.name        = "okuribito_rails"
  s.version     = OkuribitoRails::VERSION
  s.authors     = ["Yasuhiro Matsumura"]
  s.email       = ["ym.contributor@gmail.com"]
  s.homepage    = "https://github.com/muramurasan/okuribito_rails"
  s.summary     = "OkuribitoRails is an engine for Rails that aims to be the managing method call status."
  s.description = "OkuribitoRails is an engine for Rails that aims to be the managing method call status."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "okuribito"
  s.add_dependency "rails", ['>= 4.0', '< 6']
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "rubocop"
end
