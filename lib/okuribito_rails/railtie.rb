require "okuribito_rails/regist_method"
require "okuribito_rails/observe_method"

module OkuribitoRails
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      if ActiveRecord::Base.connection.table_exists? 'okuribito_rails_method_call_situations'
        yaml_path = OkuribitoRails.config.setting_path

        # Update database by observed methods.
        RegistMethod.new.update_observe_methods(yaml_path)

        # Define behavior that when method called.
        okuribito = ObserveMethod.new.patch_okuribito
        okuribito.apply(yaml_path) if File.exist?(yaml_path)
      end
    end
  end
end
