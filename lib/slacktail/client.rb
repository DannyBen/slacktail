module Slacktail
  class Client
    class << self
      attr_writer :default

      def default
        @default ||= default!
      end

      def can_connect?
        !!ENV['SLACK_API_TOKEN']
      end

      def default!
        raise ArgumentError, 'Please set SLACK_API_TOKEN' unless can_connect?
        Slack.configure { |c| c.token = ENV['SLACK_API_TOKEN'] }
        Slack::RealTime::Client.new
      end
    end
  end
end

  
