require 'spec_helper'

describe Command do
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
    it "works" do
      expect{ subject.run 'CHANNELS' => ['debug', 'general'] }.to output_fixture('command/run')
    end
  end

  context "on message event" do
    it "works" do
      supress_output { subject.run }
      expect { client.simulate :message, message_mock }.to output_fixture('command/message').diff(4)
    end

    context "when the message is not in a channel we care about" do
      it "does not show anything" do
        supress_output { subject.run "CHANNELS" => "void" }
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
