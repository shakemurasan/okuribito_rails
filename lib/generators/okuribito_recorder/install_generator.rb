require 'rails/generators'

module OkuribitoRecorder
  class InstallGenerator < Rails::Generators::Base
    class_option "with-migrate", :type => :boolean

    def install_migrations
      puts "Copying over OkuribitoRecorder migrations..."
      Dir.chdir(Rails.root) do
        `rake okuribito_recorder:install:migrations`
      end
    end

    def run_migrations
      if options["with-migrate"]
        puts "Running rake db:migrate"
        `rake db:migrate`
      end
    end

    def mount_engine
      puts "Insert routing..."
      route("mount OkuribitoRecorder::Engine, :at => '/okuribito_recorder'")
    end

    def create_config_initializer
      puts "Create configuration..."
      OkuribitoRecorder::InstallGenerator.source_root File.expand_path('../templates', __FILE__)
      template 'initializer.erb', 'config/initializers/okuribito_recorder.rb'
    end

    def finished
      puts "\n\n" + ("*" * 53)
      puts "Done! OkuribitoRecorder has been successfully installed."
    end
  end
end