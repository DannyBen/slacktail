module Slacktail
  module HasText
    include Colsole

    def text
      @text ||= text!
    end

    def text!
      data.text ? data.text.gsub(/```\n?/, '').strip : ''
    end

    def text_lines
      word_wrap("   #{text}").split("\n").map(&:strip)
    end
  end
end