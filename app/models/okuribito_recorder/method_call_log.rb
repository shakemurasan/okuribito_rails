module OkuribitoRecorder
  class MethodCallLog < ActiveRecord::Base
    belongs_to :method_call_situation
  end
end
