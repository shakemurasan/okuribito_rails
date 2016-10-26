module OkuribitoRecorder
  require "okuribito"

  class Railtie < ::Rails::Railtie
    config.after_initialize do
      okuribito = Okuribito::OkuribitoPatch.new do |method_name, obj_name, caller_info|
        puts "#{obj_name} #{method_name} #{caller_info[0]}"
      end
      okuribito.apply("config/okuribito.yml")
    end
  end
end
