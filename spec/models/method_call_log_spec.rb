require "spec_helper"

describe OkuribitoRails::MethodCallLog do
  let(:method_call_situation) { FactoryGirl.create(:method_call_situation) }
  let(:method_call_log) do
    FactoryGirl.build(:method_call_log,
                      method_call_situation: method_call_situation,
                      class_name: class_name,
                      method_symbol: method_symbol,
                      method_name: method_name)
  end
  let(:class_name) { "User" }
  let(:method_symbol) { "." }
  let(:method_name) { "feed" }

  subject { method_call_log }

  describe "must have a MethodCallSituation" do
    let(:method_call_log) { FactoryGirl.build :method_call_log, method_call_situation: nil }
    it { is_expected.not_to be_valid }
  end

  describe "valid class_name" do
    it { is_expected.to be_valid }

    context "with valid long name" do
      let(:class_name) { "a" * 255 }
      it { is_expected.to be_valid }
    end
  end

  describe "invalid class_name" do
    context "must have a name" do
      let(:class_name) { nil }
      it { is_expected.not_to be_valid }
    end

    context "with no name" do
      let(:class_name) { "" }
      it { is_expected.not_to be_valid }
    end

    context "with too long name" do
      let(:class_name) { "a" * 256 }
      it { is_expected.not_to be_valid }
    end
  end

  describe "valid method_symbol" do
    context "with valid symbol '.'" do
      let(:method_symbol) { "." }
      it { is_expected.to be_valid }
    end

    context "with valid symbol '#'" do
      let(:method_symbol) { "#" }
      it { is_expected.to be_valid }
    end
  end

  describe "invalid method_symbol" do
    context "with invalid symbol '$'" do
      let(:method_symbol) { "$" }
      it { is_expected.not_to be_valid }
    end
  end

  describe "valid method_name" do
    it { is_expected.to be_valid }

    context "with valid long name" do
      let(:method_name) { "a" * 255 }
      it { is_expected.to be_valid }
    end
  end

  describe "invalid method_name" do
    context "must have a name" do
      let(:method_name) { nil }
      it { is_expected.not_to be_valid }
    end

    context "with no name" do
      let(:method_name) { "" }
      it { is_expected.not_to be_valid }
    end

    context "with too long name" do
      let(:method_name) { "a" * 256 }
      it { is_expected.not_to be_valid }
    end
  end
end
