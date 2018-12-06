class String
  def to_markdown
    TTY::Markdown.parse self
  end

  def to_colsole_color
    color = {
      '000000' => :wht,
      'ff0000' => :red,
      '00ff00' => :grn,
      '0000ff' => :blu,
      'ffff00' => :ylw,
      'ff00ff' => :pur,
      '00ffff' => :cyn,
      'ffffff' => :blk,
    }

    key = self.downcase
    color.keys.include?(key) ? color[key] : :rst
  end
end
