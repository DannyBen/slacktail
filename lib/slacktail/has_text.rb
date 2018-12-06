module Slacktail
  module HasText
    def text
      @text ||= text!
    end

    def text!
      data.text ? data.text.gsub(/```\n?/, '').strip : ''
    end

    def text_lines
      text.split "\n"
    end
  end
end