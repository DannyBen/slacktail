module Slacktail
  class Message < Base
    include MessageView, HasText, HasClient

    def channel
      @channel ||= channel!
    end

    def color
      attachments.any? ? attachments.first.color : :cyn
    end

    def items
      @items ||= items!
    end

  private

    def attachments
      @attachments ||= attachments!
    end

    def items!
      result = text_lines
      attachments.each do |attachment|
        result += attachment.text_lines
        result += attachment.fields
      end
      result
    end

    def channel!
      channel = client.channels[data.channel]
      channel ? "##{channel.name}" : "@private"
    end

    def attachments!
      return [] unless data.attachments
      data.attachments.map { |attachment| Attachment.new attachment }
    end
  end

end