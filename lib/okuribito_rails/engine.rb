module OkuribitoRails
  class Engine < ::Rails::Engine
    isolate_namespace OkuribitoRails

    initializer "okuribito_rails.assets.precompile", group: :all do |app|
      app.config.assets.precompile += %w(
        okuribito_rails/logo.png
        okuribito_rails/application.css
        okuribito_rails/header.css
        okuribito_rails/method_call_info.css
      )
    end
  end

  class << self
    def config
      @config ||= Config.new
    end

    def configure
      yield config
    end
  end
end
