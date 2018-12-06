module Slacktail
  module HasText
    include Colsole

    def text
      @text ||= text!
    end

    def text!
      return '' unless data.text

      result = data.text
      result = sanitize_text result
      result = evaluate_users result
      result
    end

    def text_lines
      word_wrap("   #{text}").split("\n").map(&:strip)
    end

  private

    def sanitize_text(text)
      data.text.gsub(/```\n?/, '').strip
    end

    def evaluate_users(text)
      text.gsub(/<@([^>]+)>/) do
        user = client.users[$1]&.name || "anonymous"
        "@#{user}"
      end
    end

  end
end