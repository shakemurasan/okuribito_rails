require_dependency "okuribito_rails/application_controller"

module OkuribitoRails
  class MethodCallSituationsController < ApplicationController
    def index
      @method_call_situations = MethodCallSituation
                                .search(method_call_situation_params.presence || {})
                                .page(params[Kaminari.config.param_name])
                                .order(class_name: :asc, method_symbol: :asc, method_name: :asc)
    end

    private

    def method_call_situation_params
      params.permit(:class_name, :method_name, :x_days_passed, :uncalled_method, :called_method)
    end
  end
end
