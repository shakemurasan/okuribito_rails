module OkuribitoRails
  class MethodCallSituation < ActiveRecord::Base
    has_many :method_call_logs
  end
end
