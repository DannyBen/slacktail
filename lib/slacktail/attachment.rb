module Slacktail
  class Attachment < Base
    include HasText

    def color
      data.color || ''
    end
    
    def fields
      @fields ||= fields!
    end

    def fields!
      return [] unless data.fields
      data.fields.map { |field| Field.new field }
    end
  end
end