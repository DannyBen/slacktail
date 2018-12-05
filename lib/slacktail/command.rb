module Slacktail
  class Command < MisterBin::Command
    include HasClient

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

      client.on :message do |data|
        message = Message.new data
        message.render unless message.empty?
      end

      client.on(:hello) { resay "!txtgrn!Ready\n" }
      client.on(:closed) { |_data| say "Goodbye" }
      client.start!
    end

  end
end

