module OkuribitoRecorder
  require "okuribito"

  class Railtie < ::Rails::Railtie
    config.after_initialize do
      yaml_path = OkuribitoRecorder.config.setting_path
      okuribito = Okuribito::OkuribitoPatch.new(once_detect: OkuribitoRecorder.config.once_detect) do |method_name, _obj_name, caller_info, class_name, method_symbol|
        situation = MethodCallSituation.find_by(class_name: class_name,
                                                method_symbol: method_symbol,
                                                method_name: method_name)
        if situation.present?
          situation.increment!(:called_num)
          MethodCallLog.create(method_call_situation: situation,
                               class_name: class_name,
                               method_symbol: method_symbol,
                               method_name: method_name,
                               back_trace: caller_info[0])
        end
      end

      if ActiveRecord::Base.connection.table_exists? 'okuribito_recorder_method_call_situations'
        RegistMethod.new.update_observe_methods(yaml_path)
        okuribito.apply(yaml_path) if File.exist?(yaml_path)
      end
    end
  end
end
