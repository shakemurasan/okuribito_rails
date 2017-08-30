require_dependency "okuribito_rails/application_controller"

module OkuribitoRails
  class MethodCallLogsController < ApplicationController
    def index
      @method_call_logs = MethodCallLog
                          .search(search_params)
                          .page(params[Kaminari.config.param_name])
    end

    private

    def search_params
      params.slice(
        :class_name,
        :method_name
      ).presence || {}
    end
  end
end
