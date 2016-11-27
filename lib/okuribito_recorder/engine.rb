require "okuribito_recorder/config"

module OkuribitoRecorder
  class Engine < ::Rails::Engine
    isolate_namespace OkuribitoRecorder
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
