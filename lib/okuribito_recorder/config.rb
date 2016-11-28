module OkuribitoRails
  class Config
    include ActiveSupport::Configurable

    config_accessor :once_detect
    config_accessor :setting_path
  end
end