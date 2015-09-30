class RomanNumerals
  def self.from_roman number
    number.scan(/IV|IX|I|V|XL|XC|X|L|CD|CM|C|D|M/).map { |char|
      case char
        when 'I'  then 1
        when 'IV' then 4
        when 'V'  then 5
        when 'IX' then 9
        when 'X'  then 10
        when 'XL' then 40
        when 'L'  then 50
        when 'XC' then 90
        when 'C'  then 100
        when 'CD' then 400
        when 'D'  then 500
        when 'CM' then 900
        when 'M'  then 1000
      end
    }.reduce(&:+)
  end

  def self.to_roman number
    parseNumber(number)
  end

  def self.parseNumber number
    case
      when number >= 1000 then digit, removed = 'M',  1000
      when number >= 900  then digit, removed = 'CM', 900
      when number >= 500  then digit, removed = 'D',  500
      when number >= 400  then digit, removed = 'CD', 400
      when number >= 100  then digit, removed = 'C',  100
      when number >= 90   then digit, removed = 'XC', 90
      when number >= 50   then digit, removed = 'L',  50
      when number >= 40   then digit, removed = 'XL', 40
      when number >= 10   then digit, removed = 'X',  10
      when number >= 9    then digit, removed = 'IX', 9
      when number >= 5    then digit, removed = 'V',  5
      when number >= 4    then digit, removed = 'IV', 4
      when number >= 1    then digit, removed = 'I',  1
      else return ''
    end
    digit + self.parseNumber(number - removed)
  end
end

def expectToEqual text, expected, real
  if expected == real
    print '.'
  else
    puts "Fail. #{text} is expected '#{expected}', but return '#{real}'."
  end
end

expectToEqual 'RomanNumerals.to_roman(2008)',         'MMVIII',  RomanNumerals.to_roman(2008)
expectToEqual 'RomanNumerals.to_roman(1990)',         'MCMXC',   RomanNumerals.to_roman(1990)
expectToEqual 'RomanNumerals.to_roman(1666)',         'MDCLXVI', RomanNumerals.to_roman(1666)
expectToEqual 'RomanNumerals.to_roman(1000)',         'M',       RomanNumerals.to_roman(1000)
expectToEqual 'RomanNumerals.to_roman(900)',          'CM',      RomanNumerals.to_roman(900)
expectToEqual 'RomanNumerals.to_roman(119)',          'CXIX',    RomanNumerals.to_roman(119)
expectToEqual 'RomanNumerals.to_roman(40)',           'XL',      RomanNumerals.to_roman(40)
expectToEqual 'RomanNumerals.to_roman(3)',            'III',     RomanNumerals.to_roman(3)
expectToEqual 'RomanNumerals.from_roman(I)',          1,         RomanNumerals.from_roman('I')
expectToEqual 'RomanNumerals.from_roman(V)',          5,         RomanNumerals.from_roman('V')
expectToEqual 'RomanNumerals.from_roman(X)',          10,        RomanNumerals.from_roman('X')
expectToEqual 'RomanNumerals.from_roman(L)',          50,        RomanNumerals.from_roman('L')
expectToEqual 'RomanNumerals.from_roman(C)',          100,       RomanNumerals.from_roman('C')
expectToEqual 'RomanNumerals.from_roman(D)',          500,       RomanNumerals.from_roman('D')
expectToEqual 'RomanNumerals.from_roman(M)',          1000,      RomanNumerals.from_roman('M')
expectToEqual 'RomanNumerals.from_roman(II)',         2,         RomanNumerals.from_roman('II')
expectToEqual 'RomanNumerals.from_roman(VIII)',       8,         RomanNumerals.from_roman('VIII')
expectToEqual 'RomanNumerals.from_roman(XXXI)',       31,        RomanNumerals.from_roman('XXXI')
expectToEqual 'RomanNumerals.from_roman(IV)',         4,         RomanNumerals.from_roman('IV')
expectToEqual 'RomanNumerals.from_roman(CM)',         900,       RomanNumerals.from_roman('CM')
expectToEqual 'RomanNumerals.from_roman(MDCLXVI)',    1666,      RomanNumerals.from_roman('MDCLXVI')
expectToEqual 'RomanNumerals.from_roman(MCMXC)',      1990,      RomanNumerals.from_roman('MCMXC')
expectToEqual 'RomanNumerals.from_roman(MMVIII)',     2008,      RomanNumerals.from_roman('MMVIII')
expectToEqual 'RomanNumerals.from_roman(MMMMMMMCCC)', 7300,      RomanNumerals.from_roman('MMMMMMMCCC')

puts
puts 'Test is done.'