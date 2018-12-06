module Slacktail
  module MessageView
    include Colsole

    def render
      prefix = "!txt#{color}!▌!txtrst! "
      now = Time.now.strftime "%H:%M"
      say "#{prefix}!txtcyn!#{now} ➤ !bldcyn!@#{user}!txtcyn! ➤ #{channel}".strip

      items.each do |line|
        if line.is_a? String
          say "#{prefix}#{line.to_markdown}".strip
        elsif line.is_a? Field
          say "#{prefix}!txtblu!#{line.key}!txtrst! : !txtgrn!#{line.value}".strip
        end
      end

      say ""
    end

  end
end
