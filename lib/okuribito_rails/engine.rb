module OkuribitoRails
  class Engine < ::Rails::Engine
    isolate_namespace OkuribitoRails
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
