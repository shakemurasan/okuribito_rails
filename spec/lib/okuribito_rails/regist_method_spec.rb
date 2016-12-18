require "spec_helper"
require "support/test_target"

shared_examples "Evaluate the condition of MethodCallSituation" do
  it { expect(OkuribitoRails::MethodCallSituation.find_by(class_name: "TestTarget", method_symbol: ".", method_name: "deprecated_self_method")).to be_present }
  it { expect(OkuribitoRails::MethodCallSituation.find_by(class_name: "TestTarget", method_symbol: "#", method_name: "deprecated_method")).to be_present }
end

describe OkuribitoRails::RegistMethod do
  let(:setting_path) { "spec/support/test_config.yml" }

  describe "create MethodCallSituation" do
    context "registered none" do
      before do
        OkuribitoRails::RegistMethod.new.update_observe_methods(setting_path)
      end

      it_behaves_like "Evaluate the condition of MethodCallSituation"
    end

    context "registered one (Already registered)" do
      before do
        FactoryGirl.create(:method_call_situation, class_name: "TestTarget", method_symbol: "#", method_name: "deprecated_method")
        OkuribitoRails::RegistMethod.new.update_observe_methods(setting_path)
      end

      it_behaves_like "Evaluate the condition of MethodCallSituation"
    end

    context "registered one (Delete target)" do
      before do
        FactoryGirl.create(:method_call_situation, class_name: "TestTarget", method_symbol: "#", method_name: "delete_target_method")
        OkuribitoRails::RegistMethod.new.update_observe_methods(setting_path)
      end

      it_behaves_like "Evaluate the condition of MethodCallSituation"
      it { expect(OkuribitoRails::MethodCallSituation.find_by(class_name: "TestTarget", method_symbol: "#", method_name: "delete_target_method")).not_to be_present }
    end
  end
end
