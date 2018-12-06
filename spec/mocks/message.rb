module Slacktail
  module Mocks
    # This mock is intended to be fed as data into the original Message 
    # object: Message.new(Mocks::Message.new)
    class Message
      include MessageView

      def initialize(attachments: true, user: :user)
        @attachments = attachments
        @user = user
      end

      def text
        "Main message text"
      end

      def username
        @user == :user ? "Luke" : nil
      end

      def bot_id
        @user == :bot ? "R2D2" : nil
      end

      def channel
        "debug"
      end

      def attachments
        return nil unless @attachments
        [
          OpenStruct.new(OpenStruct.new({
            text: "*Build SUCCESS*: `deploy-website` *#45*",
            fields: [
              OpenStruct.new({ title: "Build Number", value: "45" }),
              OpenStruct.new({ title: "Environment", value: "Production" }),
            ]
          }))
        ]
      end      
    end
  end
end