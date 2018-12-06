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

    def run(args = nil)
      args ||= {}
      @channels = args['CHANNELS'] || []

      say "Connecting... " if Client.can_connect?

      client.on :message do |data|
        @message = Message.new data
        @message.render unless skip?
      end

      client.on(:hello) { resay "!txtgrn!Ready\n" }
      client.on(:closed) { |_data| say "Goodbye" }
      client.start!
    end

  private

    def skip?
      return true if @message.empty?
      return false if @channels.empty?
      return false if @channels.include? @message.pure_channel
      return true
    end

  end
end

