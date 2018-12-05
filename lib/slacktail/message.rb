module Slacktail
  class Message < Base
    include MessageView, HasText

    class << self
      attr_reader :client

      def client=(client)
        @client = client
      end
    end

    def channel
      @channel ||= channel!
    end

    def channel!
      client.channels[data.channel]&.name || "@private"
    end

    def attachments
      @attachments ||= attachments!
    end

    def attachments!
      return [] unless data.attachments
      data.attachments.map { |attachment| Attachment.new attachment }
    end

    def client
      self.class.client
    end
  end

end