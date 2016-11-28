require_dependency "okuribito_rails/application_controller"

module OkuribitoRails
  class MethodCallLogsController < ApplicationController
    def index
      @method_call_logs = MethodCallLog.page(params[Kaminari.config.param_name]).per(20)
    end
  end
end
