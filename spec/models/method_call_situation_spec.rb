require "spec_helper"

describe OkuribitoRails::MethodCallSituation do
  let(:method_call_situation) { FactoryGirl.create(:method_call_situation,
                                                   class_name: class_name,
                                                   method_symbol: ".",
                                                   method_name: "feed") }
  let(:class_name) { "User" }

  subject { method_call_situation }

  describe "valid name" do
    it { is_expected.to be_valid }
  end
end
