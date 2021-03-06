require "rails/generators"

module OkuribitoRails
  class InstallGenerator < Rails::Generators::Base
    class_option "with-migrate", type: :boolean

    def start
      puts "Start installing okuribito_rails..."
      puts "*" * 80 + "\n"
    end

    def install_migrations
      puts "Copying over OkuribitoRails migrations..."
      Dir.chdir(Rails.root) do
        `rake okuribito_rails:install:migrations`
      end
    end

    def run_migrations
      return unless options["with-migrate"]
      puts "Running rake db:migrate"
      `rake db:migrate`
    end

    def mount_engine
      puts "Insert routing..."
      route("mount OkuribitoRails::Engine, :at => '/okuribito_rails'")
    end

    def create_config_initializer
      puts "Create configuration..."
      OkuribitoRails::InstallGenerator.source_root File.expand_path("../templates", __FILE__)
      template "initializer.erb", "config/initializers/okuribito_rails.rb"
    end

    def finished
      puts "\n" + ("*" * 80)
      puts "Done! OkuribitoRails has been successfully installed."
      puts "Please create and deploy a configuration file of okuribito."
      puts "(The yaml that defines the method you want to monitor)"
    end
  end
end
