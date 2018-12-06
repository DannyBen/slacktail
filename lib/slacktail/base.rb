module Slacktail
  class Base
    include HasClient

    attr_reader :data
    
    def initialize(data)
      @data = data
    end
  end
end
