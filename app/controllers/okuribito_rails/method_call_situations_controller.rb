require_dependency "okuribito_rails/application_controller"

module OkuribitoRails
  class MethodCallSituationsController < ApplicationController
    def index
      @method_call_situations = MethodCallSituation
                                .page(params[Kaminari.config.param_name])
                                .per(20)
                                .order(class_name: :asc, method_symbol: :asc, method_name: :asc)
    end
  end
end
