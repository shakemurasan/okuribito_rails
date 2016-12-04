begin
  require 'bundler/setup'
end

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task default: :spec

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'
