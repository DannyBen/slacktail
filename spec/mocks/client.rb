module Slacktail
  module Mocks
    class Client
      include Colsole

      attr_reader :echo

      def initialize(echo: true)
        @echo = echo
      end

      def on(event, &block)
        puts "registered #{event}" if echo
        hooks[event] = block
      end

      def token=(value)
        puts "token=#{value}" if echo
      end

      def start!
        if echo
          puts "starting!"
        else
          # actual simulation of a client connection
          # :nocov:
          sleep 1
          resay "!txtgrn!Ready\n"
          # :nocov:
        end
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

