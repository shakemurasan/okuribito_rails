require_dependency "okuribito_rails/application_controller"

module OkuribitoRails
  class TopController < ApplicationController
    def show
      redirect_to method_call_logs_path
    end
  end
end
