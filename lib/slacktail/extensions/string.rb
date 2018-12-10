class String
  def to_colsole_color
    color = {
      '000000' => :blk,
      'ff0000' => :red,
      '00ff00' => :grn,
      '0000ff' => :blu,
      'ffff00' => :ylw,
      'ff00ff' => :pur,
      '00ffff' => :cyn,
      'ffffff' => :wht,
    }

    key = self.downcase.round_color
    color.keys.include?(key) ? color[key] : :rst
  end

  def hex_color?
    match /^[0-9a-fA-F]{6}$/
  end

  def round_color
    return self unless hex_color?
    rgb = scan(/.{2}/).map { |h| ((h.to_i(16) / 255.0).round * 15).to_s(16) }
    rgb.map { |c| "#{c}#{c}" }.join
  end
end
