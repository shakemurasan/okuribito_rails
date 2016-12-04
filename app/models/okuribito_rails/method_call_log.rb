module OkuribitoRails
  class MethodCallLog < ActiveRecord::Base
    belongs_to :method_call_situation

    validates :class_name, presence: true, length: { minimum: 1, maximum: 255 }
    validates :method_symbol, presence: true, inclusion: { in: %w(. #) }
    validates :method_name, presence: true, length: { minimum: 1, maximum: 255 }
  end
end
