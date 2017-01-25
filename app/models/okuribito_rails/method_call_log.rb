module OkuribitoRails
  class MethodCallLog < ActiveRecord::Base
    belongs_to :method_call_situation, counter_cache: :called_num

    validates :class_name, presence: true, length: { minimum: 1, maximum: 255 }
    validates :method_symbol, presence: true, inclusion: { in: %w(. #) }
    validates :method_name, presence: true, length: { minimum: 1, maximum: 255 }

    scope :with_class_name, ->(class_name) { where("class_name LIKE ?", "%#{class_name}%") }
    scope :with_method_name, ->(method_name) { where("method_name LIKE ?", "%#{method_name}%") }

    def self.search(args)
      mcl = self
      mcl = mcl.with_class_name(args[:class_name]) if args[:class_name].present?
      mcl = mcl.with_method_name(args[:method_name]) if args[:method_name].present?
      mcl
    end
  end
end
