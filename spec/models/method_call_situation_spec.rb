require "spec_helper"

describe OkuribitoRails::MethodCallSituation do
  let(:method_call_situation) do
    FactoryGirl.build(:method_call_situation,
                      class_name: class_name,
                      method_symbol: method_symbol,
                      method_name: method_name,
                      called_num: called_num)
  end
  let(:class_name) { "TestTarget" }
  let(:method_symbol) { "#" }
  let(:method_name) { "deprecated_method" }
  let(:called_num) { 0 }

  subject { method_call_situation }

  describe "valid class_name" do
    it { is_expected.to be_valid }

    context "with valid long name" do
      let(:class_name) { "A" << "a" * 254 }
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
      let(:class_name) { "A" << "a" * 255 }
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

  describe "valid called_num" do
    it { is_expected.to be_valid }

    context "with valid large number" do
      let(:called_num) { 9999 }
      it { is_expected.to be_valid }
    end
  end

  describe "invalid called_num" do
    context "must have a value" do
      let(:called_num) { nil }
      it { is_expected.not_to be_valid }
    end

    context "with string" do
      let(:called_num) { "a" }
      it { is_expected.not_to be_valid }
    end

    context "with too large number" do
      let(:called_num) { 10_000 }
      it { is_expected.not_to be_valid }
    end
  end

  describe "duplicate registration" do
    before do
      FactoryGirl.create(:method_call_situation,
                         class_name: class_name,
                         method_symbol: method_symbol,
                         method_name: method_name,
                         called_num: called_num)
    end

    it { is_expected.not_to be_valid }
  end
end
