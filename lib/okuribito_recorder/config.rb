module OkuribitoRecorder
  class Config
    include ActiveSupport::Configurable

    config_accessor :once_detect
  end
end