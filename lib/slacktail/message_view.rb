module Slacktail
  module MessageView
    include Colsole

    def render
      prefix = "!txt#{color}!▌!txtrst! "

      say "!und#{color}!#{channel}     !txtrst!"
      say prefix.strip

      items.each do |line|
        if line.is_a? String
          say "#{prefix}#{line}".strip
        elsif line.is_a? Field
          say "#{prefix}!txtblu!#{line.key}!txtrst! : !txtgrn!#{line.value}".strip
        end
      end

      say prefix.strip
      say ""
    end

  end
end
