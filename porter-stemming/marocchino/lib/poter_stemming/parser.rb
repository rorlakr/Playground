module PoterStemming
  class Parser
    # for debug
    def parse_step(s, origin)
      step = Step.new(s)
      step.parse(origin)
      step.result
    end

    def parse(origin)
      step = Step.new(:one_a)
      step.parse(origin)
      while step.next
        old_result = step.result
        step = Step.new(step.next)
        step.parse(old_result)
      end
      step.result
    end
  end
end
