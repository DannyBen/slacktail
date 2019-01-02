require 'spec_helper'

describe Command do
  subject { described_class.new args }
  let(:args) { {} }
  let(:client) { Mocks::Client.new }
  let(:message_mock) { Mocks::Message.new }
  
  before do
    Client.default = client
  end

  context "without arguments" do
    it "works" do
      expect{ subject.run }.to output_fixture('command/run')
    end
  end

  context "with one or more channels" do
    let(:args) { { 'CHANNELS' => ['debug', 'general'] } }

    it "works" do
      expect{ subject.run }.to output_fixture('command/run')
    end
  end

  context "on message event" do
    it "works" do
      supress_output { subject.run }
      expect { client.simulate :message, message_mock }.to output_fixture('command/message').diff(4)
    end

    context "when the message is not in a channel we care about" do
      let(:args) { { "CHANNELS" => "void" } }
      
      it "does not show anything" do
        supress_output { subject.run }
        expect { client.simulate :message, message_mock }.to_not output.to_stdout
      end
    end
  end

  context "on hello event" do
    it "works" do
      supress_output { subject.run }
      expect { client.simulate :hello }.to output_fixture('command/hello')
    end
  end

  context "on closed event" do
    it "works" do
      supress_output { subject.run }
      expect { client.simulate :closed }.to output_fixture('command/closed')
    end
  end

end
