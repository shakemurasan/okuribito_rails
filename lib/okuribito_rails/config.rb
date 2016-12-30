module OkuribitoRails
  class Config
    include ActiveSupport::Configurable

    config_accessor :once_detect do
      true
    end

    config_accessor :setting_path do
      "config/okuribito.yml"
    end

    config_accessor :prohibit_webui do
      ["test"]
    end

    config_accessor :prohibit_observe do
      ["test"]
    end

    config_accessor :force_eager_load do
      ["test"]
    end
  end
end
