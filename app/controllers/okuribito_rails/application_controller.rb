module OkuribitoRails
  class ApplicationController < ActionController::Base
    protect_from_forgery

    before_action :available_action!

    def available_action!
      if prohibited_env?
        head :forbidden
      end
    end

    private

    def prohibited_env?
      OkuribitoRails.config.prohibit_webui.include?(ENV["RAILS_ENV"])
    end
  end
end
