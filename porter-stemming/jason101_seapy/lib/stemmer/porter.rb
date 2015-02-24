class Stemmer::Porter
  def s_1a(str)
   if str.upcase.end_with?('SSES')
      return "#{str[0...-4]}ss"
    elsif str.upcase.end_with?('IES')
      return "#{str[0...-3]}i"
    elsif str.upcase.end_with?('SS')
      return str
    elsif str.upcase.end_with?('S')
      return str[0...-1]
    end
  end

  def s_1b(str)
    if str.upcase.end_with?('EED')
      sub_str = str[0...-3]
      if m_count(sub_str) > 0
        return "#{str[0...-3]}ee"
      else
        return str
      end
    elsif str.upcase.end_with?('ED')
      return "#{str[0...-2]}"
    elsif str.upcase.end_with?('ING')
      return "#{str[0...-3]}"
    end
  end

  def vowel?(char)
    !char[/[aeiou]/].nil?
  end

  def m_count(str)
    count = 0
    prev_char_vowel = nil
    str.chars.each do |char|
      if prev_char_vowel.nil?
        prev_char_vowel = vowel?(char)
        next
      elsif prev_char_vowel != vowel?(char)
        prev_char_vowel = vowel?(char)
        count = count + 1
      end
    end
    count
  end

  def has_vowel?(str)
    str.chars.each do |char|
      return true if vowel?(char)
    end
    false
  end
end