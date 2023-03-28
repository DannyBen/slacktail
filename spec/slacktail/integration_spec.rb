require 'spec_helper'

describe Client, :local do
  subject { described_class.default }

  before :all do
    ENV['SLACK_API_TOKEN'] = ORIGINAL_SLACK_API_TOKEN
    described_class.default = nil
    described_class.default.start_async
    sleep 5  # wait for cache population
  end

  describe '#users' do
    it 'returns a hash of User objects' do
      expect(subject.users).to be_a Hash
      expect(subject.users.values.first).to be_a Slack::RealTime::Models::User
    end
  end

  describe '#channels' do
    it 'returns a hash of Channel objects' do
      expect(subject.channels).to be_a Hash
      expect(subject.channels.values.first).to be_a Slack::RealTime::Models::Channel
    end
  end

  describe '#bots' do
    it 'returns a hash of Bot objects' do
      expect(subject.bots).to be_a Hash
      expect(subject.bots.values.first).to be_a Slack::RealTime::Models::Bot
    end
  end
end
