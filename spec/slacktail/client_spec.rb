require 'spec_helper'

describe Client do
  subject { described_class }
  let(:mock_client) { Mocks::Client.new }

  describe '::default!' do
    context "when SLACK_API_TOKEN is not set" do
      before { ENV['SLACK_API_TOKEN'] = nil }

      it "raises an error" do
        expect{ subject.default! }.to raise_error(ArgumentError, "Please set SLACK_API_TOKEN")
      end      
    end

    context "when SLACK_API_TOKEN is set" do
      before { ENV['SLACK_API_TOKEN'] = 'some-secret-token' }

      it "configures the slack client with the token" do
        expect(Slack).to receive(:configure) do |*args, &block|
          expect{ block.call(mock_client) }.to output("token=some-secret-token\n").to_stdout
        end
        subject.default!
      end

      it "returns a realtime slack client instance" do
        expect(subject.default!).to be_a Slack::RealTime::Client
      end      
    end
  end
end
