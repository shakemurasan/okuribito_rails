require "okuribito_rails/regist_method"
require "okuribito_rails/observe_method"

module OkuribitoRails
  class StartObserver
    def start
      return if prohibit_env? || before_migrate?
      return unless File.exist?(yaml_path = setting_path)

      Rails.application.eager_load! if force_eager_load?

      regist_method(yaml_path)
      start_observer(yaml_path)
    end

    private

    def prohibit_env?
      OkuribitoRails.config.prohibit_observe.include?(ENV["RAILS_ENV"])
    end

    def force_eager_load?
      OkuribitoRails.config.force_eager_load.include?(ENV["RAILS_ENV"])
    end

    def before_migrate?
      !ActiveRecord::Base.connection.table_exists? "okuribito_rails_method_call_situations"
    end

    def setting_path
      OkuribitoRails.config.setting_path
    end

    def regist_method(yaml_path)
      # Update database by observed methods.
      RegistMethod.new.update_observe_methods(yaml_path)
    end

    def start_observer(yaml_path)
      # Define behavior that when method called.
      okuribito = ObserveMethod.new.patch_okuribito
      okuribito.apply(yaml_path)
    end
  end
end
