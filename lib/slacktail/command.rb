module Slacktail
  class Command < MisterBin::Command
    version VERSION
    summary "Show and follow slack messages in real time"

    usage "slacktail [CHANNELS...]"
    usage "slacktail (-h|--help|--version)"
    
    param "CHANNELS", "Channels to follow"

    example "slacktail"
    example "slacktail general debug"

    def run(args)
      handle args['CHANNELS']
    end

  private

    def handle(channels = nil)
      say "Connecting... "
      client = get_client

      client.on :message do |data|
        Message.new(data).render
      end

      client.on(:hello) { resay "!txtgrn!Ready\n" }
      client.on(:closed) { |_data| say "Goodbye" }
      client.start!
    end

    def get_client
      raise ArgumentError 'Please set SLACK_API_TOKEN' unless ENV['SLACK_API_TOKEN']

      Slack.configure do |config|
        config.token = ENV['SLACK_API_TOKEN']
      end

      client = Slack::RealTime::Client.new
      Message.client = client
    end

  end
end

