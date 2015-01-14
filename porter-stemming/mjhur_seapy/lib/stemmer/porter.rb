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
    
  end

  def m?(str)
    size = str.chars
    str.chars.each_with_index do |char, index|
      if vowel?(char)
        if index+1 < size && !vowel?(str.chars[index+1]) 
          return true
        end
      else
        if index+1 < size && vowel?(str.chars[index+1]) 
          return true
        end
      end
    end
    return false
  end

  # 모음이냐?
  def vowel?(char)
    !char[/[aeiou]/].nil?
  end

  def s_1c(str)
    
  end
end