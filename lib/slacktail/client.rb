module Slacktail
  class Client
    class << self
      attr_writer :default

      def default
        @default ||= default!
      end

      def can_connect?
        !!token
      end

    private

      def default!
        raise ArgumentError, 'Please set SLACK_API_TOKEN' unless can_connect?
        
        Slack.configure do |config|
          config.token = token
        end

        Slack::RealTime::Client.configure do |config|
          config.store_class = Slack::RealTime::Stores::Store
          config.store_options = { caches: :all }
        end

        Slack::RealTime::Client.new
      end

      def token
        ENV['SLACK_API_TOKEN']
      end

    end
  end
end

  
