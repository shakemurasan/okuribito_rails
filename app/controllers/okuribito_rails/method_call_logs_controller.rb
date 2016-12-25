require_dependency "okuribito_rails/application_controller"

module OkuribitoRails
  class MethodCallLogsController < ApplicationController
    def index
      @method_call_logs = MethodCallLog
                          .search(params.presence || {})
                          .page(params[Kaminari.config.param_name])
    end

    private

    def method_call_log_params
      params.permit(:class_name, :method_name)
    end
  end
end
