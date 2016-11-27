require 'rails/generators'

module OkuribitoRecorder
  class InstallGenerator < Rails::Generators::Base
    class_option "no-migrate", :type => :boolean

    def install_migrations
      puts "Copying over OkuribitoRecorder migrations..."
      Dir.chdir(Rails.root) do
        `rake okuribito_recorder:install:migrations`
      end
    end

    def run_migrations
      unless options["no-migrate"]
        puts "Running rake db:migrate"
        `rake db:migrate`
      end
    end

    def mount_engine
      route("mount OkuribitoRecorder::Engine, :at => '/okuribito_recorder'")
    end

    def finished
      puts "\n\n" + ("*" * 53)
      puts "Done! OkuribitoRecorder has been successfully installed."
    end
  end
end