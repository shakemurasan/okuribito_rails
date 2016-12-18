require "spec_helper"

describe OkuribitoRails::StartObserver do
  describe "#start" do
    let(:prohibit_env) { false }
    let(:before_migrate) { false }
    let(:setting_path) { "spec/support/test_config.yml" }
    let(:start_observer) { OkuribitoRails::StartObserver.new }

    before do
      allow(start_observer).to receive(:prohibit_env?).and_return(prohibit_env)
      allow(start_observer).to receive(:before_migrate?).and_return(before_migrate)
      allow(start_observer).to receive(:setting_path).and_return(setting_path)
      allow(start_observer).to receive(:regist_method)
      allow(start_observer).to receive(:start_observer)
      start_observer.start
    end

    context "allowed env / after_migrate" do
      it { expect(start_observer).to have_received(:regist_method) }
      it { expect(start_observer).to have_received(:start_observer) }
    end

    context "prohibited env" do
      let(:prohibit_env) { true }
      it { expect(start_observer).not_to have_received(:regist_method) }
      it { expect(start_observer).not_to have_received(:start_observer) }
    end

    context "before_migrate" do
      let(:before_migrate) { true }
      it { expect(start_observer).not_to have_received(:regist_method) }
      it { expect(start_observer).not_to have_received(:start_observer) }
    end
  end
end
