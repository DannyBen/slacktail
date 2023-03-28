require 'spec_helper'

describe Client, :local do
  subject { described_class.default }

  before :all do
    ENV['SLACK_API_TOKEN'] = ORIGINAL_SLACK_API_TOKEN
    described_class.default = nil
    described_class.default.start_async
  end

  describe '#users' do
    it 'returns a hash of User objects' do
      expect(subject.users).to be_a Hash
      expect(subject.users.values.first).to be_a Slack::RealTime::Models::User
    end
  end

  describe '#channels' do
    it 'returns a hash' do
      expect(subject.channels).to be_a Hash
    end
  end

  describe '#bots' do
    it 'returns a hash' do
      expect(subject.bots).to be_a Hash
    end
  end
end
