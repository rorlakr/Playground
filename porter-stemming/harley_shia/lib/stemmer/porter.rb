class Stemmer::Porter
  def s_1a(str)
    dic = {
      "sses" => "ss",
      "ies" => "i",
      "ss" => "ss",
      "s" => ""
    }

    dic.each do |k,v|
      return str.gsub(Regexp.new(k+"$"), v) if str.end_with?(k)
    end
  end

  def s_1b(str)
    converted = str.gsub(/eed$/, "ee")
    if str.end_with?("eed")
      converted.match(/[aeiou][^aeiou]/) ? converted : str
    else
      return str
    end
  end
end
