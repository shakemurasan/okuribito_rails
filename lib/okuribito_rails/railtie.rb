require "okuribito_rails/start_observer"

module OkuribitoRails
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      StartObserver.new.start
    end
  end
end
