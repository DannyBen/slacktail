module Slacktail
  module Mocks
    class Client
      def on(event, &block)
        puts "registered #{event}"
        hooks[event] = block
      end

      def token=(value)
        puts "token=#{value}"
      end

      def start!
        puts "starting!"
      end

      def hooks
        @hooks ||= {}
      end

      def channels
        { "debug" => OpenStruct.new(name: "debug") }
      end

      def bots
        { "R2D2" => OpenStruct.new(name: "R2D2") }
      end

      def simulate(event, data = nil)
        hooks[event].call data
      end
    end
  end
end

