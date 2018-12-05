module Slacktail
  class Field < Base
    def key
      data.title
    end

    def value
      data.value
    end
  end
end
