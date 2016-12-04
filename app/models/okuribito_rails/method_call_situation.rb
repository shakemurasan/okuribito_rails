module OkuribitoRails
  class MethodCallSituation < ActiveRecord::Base
    has_many :method_call_logs

    validates :class_name, presence: true, length: { minimum: 1, maximum: 255 }
    validates :method_symbol, presence: true, inclusion: { in: %w(. #) }
    validates :method_name, presence: true, length: { minimum: 1, maximum: 255 }
    validates :called_num,
              presence: true,
              numericality: { only_integer: true, less_than_or_equal_to: 9_999 }
  end
end
