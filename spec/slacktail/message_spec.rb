require 'spec_helper'

describe Message do
  before { Client.default = Mocks::Client.new }

  describe '#color' do
    context "with attachments" do
      subject { described_class.new Mocks::Message.new }

      it "reutrns the color of the first attachment" do
        expect(subject.color).to eq :rst
      end
    end

    context "without attachments" do
      subject { described_class.new Mocks::Message.new attachments: false }

      it "reutrns a default color" do
        expect(subject.color).to eq :cyn
      end
    end
  end

  describe '#user' do
    context "when the message has a username" do
      subject { described_class.new Mocks::Message.new }

      it "reutrns it" do
        expect(subject.user).to eq 'Luke'
      end
    end

    context "when the message has a bot_id" do
      subject { described_class.new Mocks::Message.new user: :bot }

      it "reutrns it" do
        expect(subject.user).to eq 'R2D2'
      end
    end

    context "when the message has no user and no bot" do
      subject { described_class.new Mocks::Message.new user: :unknown }

      it "reutrns it" do
        expect(subject.user).to eq 'anonymous'
      end
    end
  end
end
