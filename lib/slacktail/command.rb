module Slacktail
  class Command < MisterBin::Command
    include HasClient

    version Slacktail::VERSION
    summary "Show and follow slack messages in real time"

    usage "slacktail [CHANNELS...]"
    usage "slacktail (-h|--help|--version)"
    
    param "CHANNELS", "Channels to follow"

    example "slacktail"
    example "slacktail general debug"

    def run
      @channels = args['CHANNELS'] || []
      say "Connecting... " if Client.can_connect?
      start_client
    end

  private

    def start_client
      client.on :message do |data|
        @message = Message.new data
        @message.render unless skip?
      end

      client.on(:hello) { say "g`Ready`\n", replace: true }
      client.on(:closed) { |_data| say "Goodbye" }
      client.start!
    end

    def skip?
      return true if @message.empty?
      return false if @channels.empty?
      return false if @channels.include? @message.pure_channel
      return true
    end

  end
end

