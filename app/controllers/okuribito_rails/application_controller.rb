module OkuribitoRails
  class ApplicationController < ActionController::Base
    protect_from_forgery

    if Gem::Version.new(Rails.version) < Gem::Version.new(4)
      before_filter :available_action!
    else
      before_action :available_action!
    end

    def available_action!
      if prohibited_env?
        render nothing: true, status: 403
        return
      end
    end

    private

    def prohibited_env?
      OkuribitoRails.config.prohibit_webui.include?(ENV["RAILS_ENV"])
    end
  end
end
