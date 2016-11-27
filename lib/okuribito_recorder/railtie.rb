require "okuribito_recorder/regist_method"
require "okuribito_recorder/observe_method"

module OkuribitoRecorder
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      return unless ActiveRecord::Base.connection.table_exists? 'okuribito_recorder_method_call_situations'

      yaml_path = OkuribitoRecorder.config.setting_path

      # Update database by observed methods.
      RegistMethod.new.update_observe_methods(yaml_path)

      # Define behavior that when method called.
      okuribito = ObserveMethod.new.patch_okuribito
      okuribito.apply(yaml_path) if File.exist?(yaml_path)
    end
  end
end
