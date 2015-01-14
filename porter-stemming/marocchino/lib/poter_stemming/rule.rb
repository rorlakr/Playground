module PoterStemming
  class Rule
    UnexpectedStem = Class.new(RuntimeError)
    attr_reader :origin, :matcher, :replacer, :stem

    def initialize(rule)
      @matcher, @replacer, @stem = rule
    end

    def result
      @result ||= origin.sub(matcher, replacer)
    end

    def parse(origin)
      @origin = origin
      @result = replaceable? ? result : origin
    end

    def changed?
      origin != result
    end

    private
    def replaceable?
      case stem
      when nil then true
      when "m>0" then m > 0
      when "m>1" then m > 1
      when "*v*" then v
      when "m=1 and *o*" then m == 1 && o
      when "m=1 and not *o*" then m == 1 && !o
      else raise UnexpectedStem, "unexpect stem: #{stem}"
      end
    end

    def m
      result.scan(/[aioeu][qwrtypsdfghjklzxcvbnm]/i).size
    end

    def v
      result.match(/[aioeu]/i)
    end

    def o
      origin.match(/[qwrtypsdfghjklzxcvbnm][aioeu][qrtpsdfghjklzcvbnm]$/)
    end
  end
end
