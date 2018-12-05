module Slacktail
  module MessageView
    include Colsole

    def render
      prefix = "!txtcyn!▌!txtrst! "

      say "!undcyn!##{channel}     !txtrst!"
      say prefix.strip
      
      text_lines.each do |line|
        say "#{prefix}#{line}".strip
      end

      attachments.each do |attachment|
        # say "#{attachment.color}"
        prefix = "!txtgrn!▌!txtrst! "
        attachment.text_lines.each do |line|
          say "#{prefix}#{line}".strip
        end

        say "#{prefix}".strip if attachment.fields.size > 0
        
        attachment.fields.each do |field|
          say "#{prefix}!txtblu!#{field.key}!txtrst! : !txtgrn!#{field.value}".strip
        end
      end

      say prefix.strip
      say ""
    end

  end
end
