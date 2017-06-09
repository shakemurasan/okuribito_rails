require_dependency "okuribito_rails/application_controller"

module OkuribitoRails
  class MethodCallSituationsController < ApplicationController
    def index
      @method_call_situations = MethodCallSituation
                                .search(search_params)
                                .page(params[Kaminari.config.param_name])
                                .order(class_name: :asc, method_symbol: :asc, method_name: :asc)
    end

    private

    def search_params
      params.slice(
        :class_name,
        :method_name,
        :x_days_passed,
        :uncalled_method,
        :called_method
      ).presence || {}
    end
  end
end
