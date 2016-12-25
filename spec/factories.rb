FactoryGirl.define do
  factory :method_call_situation, class: OkuribitoRails::MethodCallSituation do
    class_name "TestTarget"
    method_symbol "#"
    method_name "deprecated_method"
    called_num 0

    trait :user_feed do
      class_name "User"
      method_symbol "#"
      method_name "feed"
    end

    trait :user_profile do
      class_name "User"
      method_symbol "#"
      method_name "profile"
    end

    trait :with_method_call_log do
      after(:create) do |method_call_situation|
        FactoryGirl.create(:method_call_log,
                           method_call_situation: method_call_situation,
                           class_name: method_call_situation.class_name,
                           method_symbol: method_call_situation.method_symbol,
                           method_name: method_call_situation.method_name)
      end
    end
  end

  factory :method_call_log, class: OkuribitoRails::MethodCallLog do
    class_name "TestTarget"
    method_symbol "#"
    method_name "deprecated_method"
  end
end
