module OkuribitoRails
  class ApplicationController < ActionController::Base
    protect_from_forgery

    before_action -> { head :forbidden }, if: -> { prohibited_env? }

    private

    def prohibited_env?
      OkuribitoRails.config.prohibit_webui.include?(ENV["RAILS_ENV"])
    end
  end
end
