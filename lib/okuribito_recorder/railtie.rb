module OkuribitoRecorder
  require "okuribito"

  class Railtie < ::Rails::Railtie
    config.after_initialize do
      okuribito = Okuribito::OkuribitoPatch.new do |method_name, _obj_name, caller_info, class_name, method_symbol|
        MethodCallLog.create(class_name: class_name,
                             method_symbol: method_symbol,
                             method_name: method_name,
                             back_trace: caller_info[0])
      end
      okuribito.apply("config/okuribito.yml") if File.exist?("config/okuribito.yml")
    end
  end
end
