require_dependency "okuribito_recorder/application_controller"

module OkuribitoRecorder
  class MethodCallLogsController < ApplicationController
    def index
      @method_call_logs = MethodCallLog.page(params[Kaminari.config.param_name]).per(20)
    end
  end
end
