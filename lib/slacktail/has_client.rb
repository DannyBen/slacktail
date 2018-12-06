module Slacktail
  module HasClient
    attr_writer :client

    def client
      @client ||= Client.default
    end
  end
end