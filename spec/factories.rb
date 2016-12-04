FactoryGirl.define do
  factory :method_call_situation, class: OkuribitoRails::MethodCallSituation do
    class_name "User"
    method_symbol "."
    method_name "feed"
    called_num 0
  end

  factory :method_call_log, class: OkuribitoRails::MethodCallLog do
    class_name "User"
    method_symbol "."
    method_name "feed"
  end
end
