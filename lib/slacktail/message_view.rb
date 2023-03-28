module Slacktail
  module MessageView
    include Colsole

    def render
      prefix = "#{color}`▌` "
      now = Time.now.strftime "%H:%M"
      say "#{prefix}c`#{now}` : cb`@#{user}` c`: #{channel}`".strip

      items.each do |line|
        if line.is_a? String
          say "#{prefix}#{line}".strip
        elsif line.is_a? Field
          say "#{prefix}b`#{line.key}` : g`#{line.value}`".strip
        end
      end

      say ""
    end

  end
end
