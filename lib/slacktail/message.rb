module Slacktail
  class Message < Base
    include MessageView, HasText

    def channel
      @channel ||= channel!
    end

    def pure_channel
      channel.gsub '#', ''
    end

    def color
      if attachments.any?
        attachments.first.color.to_colsole_color
      else
        :n
      end
    end

    def items
      @items ||= items!
    end

    def empty?
      items.empty?
    end

    def user
      result = if data.username
        data.username
      elsif data.user
        client.users[data.user]&.name
      elsif data.bot_id
        client.bots[data.bot_id]&.name
      end

      result || "anonymous"
    end

    def attachments
      @attachments ||= attachments!
    end

  private

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
      data.attachments.map do |attachment| 
        Attachment.new attachment
      end
    end
  
  end
end
