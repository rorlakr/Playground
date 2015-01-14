class PorterStemming

  # 용어의 정의
  # http://snowball.tartarus.org/algorithms/porter/stemmer.html
  #
  attr_accessor :word, :suffix, :replace

  RULES1a = [
      ['sses', 'ss', 'NULL'],
      ['ies', 'i', 'NULL'],
      ['ss', 'ss', 'NULL'],
      ['s', '', 'NULL']
  ]

  RULES1b = [
      ['eed', 'ee', 'm>0'],
      ['ed', '', '*v*'],
      ['ing', '', '*v*']
  ]

  RULES1b1 = [
      ['at', 'ate', 'NULL'],
      ['bl', 'ble', 'NULL'],
      ['iz', 'ize', 'NULL'],
      ['bb', 'b', 'NULL'],
      ['dd', 'd', 'NULL'],
      ['ff', 'f', 'NULL'],
      ['gg', 'g', 'NULL'],
      ['mm', 'm', 'NULL'],
      ['nn', 'n', 'NULL'],
      ['pp', 'p', 'NULL'],
      ['rr', 'r', 'NULL'],
      ['tt', 't', 'NULL'],
      ['ww', 'w', 'NULL'],
      ['xx', 'x', 'NULL'],
      ['', 'e', 'm=1 and *o']
  ]

  RULES2 = [
      ['ational', 'ate', 'm>0'],
      ['tional', 'tion', 'm>0'],
      ['enci', 'ence', 'm>0'],
      ['anci', 'ance', 'm>0'],
      ['izer', 'ize', 'm>0'],
      ['abli', 'able', 'm>0'],
      ['alli', 'al', 'm>0'],
      ['entli', 'ent', 'm>0'],
      ['eli', 'e', 'm>0'],
      ['ousli', 'ous', 'm>0'],
      ['ization', 'ize', 'm>0'],
      ['ation', 'ate', 'm>0'],
      ['ator', 'ate', 'm>0'],
      ['alism', 'al', 'm>0'],
      ['iveness', 'ive', 'm>0'],
      ['fulness', 'ful', 'm>0'],
      ['ousness', 'ous', 'm>0'],
      ['aliti', 'al', 'm>0'],
      ['iviti', 'ive', 'm>0'],
      ['biliti', 'ble', 'm>0']
  ]

  RULES3 = [
      ['icate', 'ic', 'm>0'],
      ['ative', '', 'm>0'],
      ['alize', 'al', 'm>0'],
      ['iciti', 'ic', 'm>0'],
      ['ical', 'ic', 'm>0'],
      ['ful', '', 'm>0'],
      ['ness', '', 'm>0']
  ]

  RULES4 = [
      ['al', '', 'm>1'],
      ['ance', '', 'm>1'],
      ['ence', '', 'm>1'],
      ['er', '', 'm>1'],
      ['ic', '', 'm>1'],
      ['able', '', 'm>1'],
      ['ible', '', 'm>1'],
      ['ant', '', 'm>1'],
      ['ement', '', 'm>1'],
      ['ment', '', 'm>1'],
      ['ent', '', 'm>1'],
      ['sion', 's', 'm>1'],
      ['tion', 't', 'm>1'],
      ['ou', '', 'm>1'],
      ['ism', '', 'm>1'],
      ['ate', '', 'm>1'],
      ['iti', '', 'm>1'],
      ['ous', '', 'm>1'],
      ['ive', '', 'm>1'],
      ['ize', '', 'm>1'],
  ]

  RULES5a = [
      ['e', '', 'm>1'],
      ['e', '', 'm=1 and not *o']
  ]

  def initialize
    @word = ''
    @suffix = ''
    @replace = ''
  end

  def set( word = '', suffix = '', replace = '' )
    @word = word
    @suffix = suffix
    @replace = replace
  end

  def stem
    if word.length > 0
      word.split(/#{suffix}$/).join
    else
      raise "단어가 지정되지 않았습니다."
    end
  end

  def measure
    stem.scan(/[aeiou][^aeiou]/).count
  end

  def m?
    measure > 0
  end

  def vowels
    stem.scan(/[aeiou]/)
  end

  def v?
    vowels.size > 0
  end

  def cvc
    stem.scan(/[^aeiou][aeiou][^aeiouwxy]$/)
  end

  def not_cvc
    stem.scan(/[aeiou][aeiou][^aeiouwxy]$/)
  end

  def o?
    stem =~ /[^aeiou][aeiou][^aeiouwxy]$/
    # cvc.size > 0
  end

  def not_o?
    stem !~ /[^aeiou][aeiou][^aeiouwxy]$/
  end

  def convert
    word.sub(/#{suffix}$/, replace)
  end

  def step_1a
    ret = "해당 단어(#{word})에 대한 규칙이 존재하지 않습니다."
    RULES1a.each do | rule |
      if word.end_with?(rule[0])
        if rule[2] == 'NULL'
          ret = word.sub(/#{rule[0]}$/, rule[1])
        else
          ret = word
        end
        break
      end
    end
    ret
  end

  def step_1b
    ret = "해당 단어(#{word})에 대한 규칙이 존재하지 않습니다."
    RULES1b.each do | rule |
      self.suffix = rule[0]
      self.replace = rule[1]
      if word.end_with?(rule[0])
        if (rule[2] == 'm>0' && m?) || (rule[2] == '*v*' && v?)
          ret = convert
        else
          ret = word
        end
        break
      end
    end
    ret
  end

  def step_1b1
    ret = "해당 단어(#{word})에 대한 규칙이 존재하지 않습니다."
    RULES1b1.each do | rule |
      self.suffix = rule[0]
      self.replace = rule[1]
      if word.end_with?(rule[0])
        if (rule[2] == 'NULL') || ((rule[2] == 'm=1 and *o') && measure == 1 && o?)
          ret = convert
        else
          ret = word
        end
        break
      end
    end
    ret
  end

  def step_2
    ret = "해당 단어(#{word})에 대한 규칙이 존재하지 않습니다."
    RULES2.each do | rule |
      self.suffix = rule[0]
      self.replace = rule[1]
      if word.end_with?(rule[0])
        if rule[2] == 'm>0' && m?
          ret = convert
        else
          ret = word
        end
        break
      end
    end
    ret
  end

  def step_3
    ret = "해당 단어(#{word})에 대한 규칙이 존재하지 않습니다."
    RULES3.each do | rule |
      self.suffix = rule[0]
      self.replace = rule[1]
      if word.end_with?(rule[0])
        if rule[2] == 'm>0' && m?
          ret = convert
        else
          ret = word
        end
        break
      end
    end
    ret
  end

  def step_4
    ret = "해당 단어(#{word})에 대한 규칙이 존재하지 않습니다."
    RULES4.each do | rule |
      self.suffix = rule[0]
      self.replace = rule[1]
      if word.end_with?(rule[0])
        if rule[2] == 'm>1' && measure > 1
          ret = convert
        else
          ret = word
        end
        break
      end
    end
    ret
  end

  def step_5a
    ret = word
    RULES5a.each do | rule |
      self.suffix = rule[0]
      self.replace = rule[1]
      if word.end_with?(rule[0])
        if (rule[2] == 'm>1' && measure > 1) || ((rule[2] == "m=1 and not *o") && (measure == 1 && not_o?))
          ret = convert
          break
        end
      else
        ret = "해당 단어(#{word})에 대한 규칙이 존재하지 않습니다."
      end
    end
    ret
  end
end