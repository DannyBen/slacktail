module Slacktail
  module Mocks
    class Message
      include MessageView

      def text
        "Main message text"
      end

      def username
        "R2D2"
      end

      def channel
        "debug"
      end

      def attachments
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