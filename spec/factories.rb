FactoryGirl.define do
  factory :method_call_situation, class: OkuribitoRails::MethodCallSituation do
    class_name "TestTarget"
    method_symbol "#"
    method_name "deprecated_method"
    called_num 0
  end

  factory :method_call_log, class: OkuribitoRails::MethodCallLog do
    class_name "TestTarget"
    method_symbol "#"
    method_name "deprecated_method"
  end
end
