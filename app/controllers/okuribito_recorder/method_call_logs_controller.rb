require_dependency "okuribito_recorder/application_controller"

module OkuribitoRecorder
  class MethodCallLogsController < ApplicationController
    def index
      @method_call_logs = MethodCallLog.all
    end
  end
end
