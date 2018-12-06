module Slacktail
  module Mocks
    # This mock is intended to be fed as data into the original Message 
    # object: Message.new(Mocks::Message.new)
    class Message
      include MessageView

      def initialize(attachments: true, user: :user, message: nil, message2: nil, fields: nil, color: nil)
        @attachments = attachments
        @user = user
        @message = message || "Main message text"
        @message2 = message2 || "*Build SUCCESS*: `deploy-website` *#45*"
        @fields = fields || default_fields
        @color = color
      end

      def text
        @message
      end

      def user
        @user == :user ? "luke-id" : nil
      end

      def bot_id
        @user == :bot ? "r2d2-id" : nil
      end

      def channel
        "debug"
      end

      def attachments
        return nil unless @attachments
        [
          OpenStruct.new(OpenStruct.new({
            text: @message2,
            color: @color,
            fields: @fields.map { |f| OpenStruct.new f }
          }))
        ]
      end

    private

      def default_fields
        [
          { title: "Build Number", value: "45" },
          { title: "Environment", value: "Production" },
        ]
      end
    end
  end
end