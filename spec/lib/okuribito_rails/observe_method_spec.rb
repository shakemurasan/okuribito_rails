require "spec_helper"
require "support/test_target"

describe OkuribitoRails::ObserveMethod do
  let(:setting_path) { "spec/support/test_config.yml" }

  describe "create MethodCallLog" do
    before do
      allow_any_instance_of(OkuribitoRails::ObserveMethod).to receive(:config_once_detect).and_return(true)
      FactoryGirl.create(:method_call_situation)
      okuribito = OkuribitoRails::ObserveMethod.new.patch_okuribito
      okuribito.apply(setting_path)
    end

    subject { OkuribitoRails::MethodCallLog.count }

    context "call patched method" do
      before do
        TestTarget.new.deprecated_method
      end

      it { is_expected.to eq 1 }
    end

    context "call unpatched method" do
      before do
        TestTarget.deprecated_self_method
      end

      it { is_expected.to eq 0 }
    end
  end
end