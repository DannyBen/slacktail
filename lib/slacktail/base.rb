module Slacktail
  class Base
    attr_reader :data
    
    def initialize(data)
      @data = data
    end
  end
end
