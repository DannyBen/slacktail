class String
  def to_colsole_color
    color = {
      '000000' => :k,
      'ff0000' => :r,
      '00ff00' => :g,
      '0000ff' => :b,
      'ffff00' => :y,
      'ff00ff' => :m,
      '00ffff' => :c,
      'ffffff' => :w,
    }

    key = self.downcase.round_color
    color.keys.include?(key) ? color[key] : :n
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
