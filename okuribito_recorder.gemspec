$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "okuribito_recorder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "okuribito_recorder"
  s.version     = OkuribitoRecorder::VERSION
  s.authors     = ["Yasuhiro Matsumura"]
  s.email       = ["ym.contributor@gmail.com"]
  s.homepage    = "https://github.com/muramurasan/okuribito_recorder"
  s.summary     = "TBD"
  s.description = "TBD"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "okuribito"
  s.add_dependency "rails", ['>= 4.0', '< 6']
  s.add_dependency "kaminari"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
