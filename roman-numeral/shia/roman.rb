class RomanNumerals
  ROMAN_NUMERAL = {
    I:  1,
    IV: 4,
    V:  5,
    IX: 9,
    X:  10,
    XL: 40,
    L:  50,
    XC: 90,
    C:  100,
    CD: 400,
    D:  500,
    CM: 900,
    M:  1000
  }

  def self.from_roman number
    number.scan(/IV|IX|I|V|XL|XC|X|L|CD|CM|C|D|M/).map { |char|
      ROMAN_NUMERAL[char.to_sym]
    }.reduce(&:+)
  end

  def self.to_roman number
    parseNumber(number)
  end

  def self.parseNumber number
    array = ROMAN_NUMERAL.to_a.sort { |a,b|a.last <=> b.last }.reverse

    el = array.find { |el|
      number >= el.last
    }

    if el
      digit, removed = el.first.to_s, el.last
      digit + self.parseNumber(number - removed)
    else
      ''
    end
  end
end

def expectToEqual text, expected, real
  if expected == real
    print '.'
  else
    puts "Fail. #{text} is expected '#{expected}', but return '#{real}'."
  end
end

TEST_CASE = {
  I: 1,
  II: 2,
  III: 3,
  IV: 4,
  V: 5,
  VIII: 8,
  X: 10,
  XXXI: 31,
  XL: 40,
  L: 50,
  C: 100,
  CXIX: 119,
  D: 500,
  CM: 900,
  M: 1000,
  MDCLXVI: 1666,
  MCMXC: 1990,
  MMVIII: 2008,
  MMMMMMMCCC: 7300
}

TEST_CASE.each { |k, v|
  expectToEqual "RomanNumerals.from_roman(#{k})", v, RomanNumerals.from_roman(k.to_s)
  expectToEqual "RomanNumerals.to_roman(#{v})", k.to_s, RomanNumerals.to_roman(v)
}

puts
puts 'Test is done.'