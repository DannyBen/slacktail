module Slacktail
  module HasClient
    def client
      Client.instance
    end
  end
end