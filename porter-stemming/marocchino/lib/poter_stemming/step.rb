module PoterStemming
  class Step
    UndefinedStep = Class.new(RuntimeError)
    STEPS = {
      one_a: [
        [/(ss|i)es$/, '\1', nil],
        [/(?<=[^s])s$/, '', nil],
      ],
      one_b: [
        [/eed$/, "ee", "m>0"],
        [/((?<=[^e])ed|ing)$/, "", "*v*"],
      ],
      one_b_one: [
        [/(at|bl|iz)$/, '\1e', nil],
        [/([bdfgmnprtwx]){2}$/, '\1', nil],
        [/$/, "e", "m=1 and *o*"]
      ],
      two: [
        [/ational$/, 'ate', "m>0"],
        [/tional$/, 'tion', "m>0"],
        [/(e|a)nci$/, '\1nce', "m>0"],
        [/izer$/, 'ize', "m>0"],
        [/abli$/, 'able', "m>0"],
        [/(al|ent|e|ous)li$/, '\1', "m>0"],
        [/((?<=iz)ation|(?<=at)ion|(?<=at)or)$/, 'e', "m>0"],
        [/((?<=al)ism|(?<=ive)ness|(?<=ful)nes|(?<=ous)ness|(?<=al)iti)$/, '', "m>0"],
        [/biliti$/, 'ble', "m>0"],
      ],
      three: [
        [/((?<=ic)ate|ative|(?<=al)ize|(?<=ic)iti|(?<=ic)al|ful|ness)$/, '', "m>0"],
      ],
      four: [
        [/(al|ance|ence|er|ic|able|ible|ant|ement|ment|ent(?<=s)ion|(?<=t)ion|ou|ism|ate|iti|ous|ive|ize)$/, '', "m>1"],
      ],
      five_a: [
        [/e$/, '', "m>1"],
        [/e$/, '', "m=1 and not *o*"],
      ],
      five_b: [
        [/ll$/, 'l', "m>1"],
      ]
    }

    attr_reader :step, :rules, :result, :origin
    def initialize(step)
      @step = step
      rules = STEPS[step] || raise(UndefinedStep, "undefined step: #{step}")
      @rules = rules.map { |r| Rule.new(r) }
    end

    def parse(origin)
      @origin = origin
      rules.each do |rule|
        rule.parse(origin)
        return @result = rule.result if rule.changed?
      end
      @result = origin
    end

    def changed?
      result != origin
    end

    def next
      !changed? && sibling || forward
    end

    private
    def sibling
      case step
      when :one_a then :one_b
      when :five_a then :five_b
      else nil
      end
    end

    def forward
      case step
      when :one_a then :two
      when :one_b then :one_b_one
      when :one_b_one then :two
      when :two then :three
      when :three then :four
      when :four then :five_a
      else nil
      end
    end
  end
end
