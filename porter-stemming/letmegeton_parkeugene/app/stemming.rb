# 포터 스테밍 알고리즘(Porter Stemming Algorithm)
# =========
#
#     포터 스테밍 알고리즘은 검색 엔진에서 사용되며,
#     단어의 접미사를 제거하거나 다른 단어로 대치하는 역할을 합니다.
#     가령 예를 들자면
#
#     * cats → cat
#     * caresses → caress
#     * conflated → conflate
#     * troubling → trouble
#     * relational → relate
#
#     이를 통해서 검색엔진의 색인어 수를 절반 이하로 감소시킬 수 있다고 합니다.
#     이번 코딩도장에서는 포터 스테밍 알고리즘의 1단계(1a, 1b, 1b1)를 구현해보도록 하겠습니다.
#     알고리즘에 대한 자세한 설명과 1단계의 목록은 [이 곳]
#     (https://web.archive.org/web/20121104182440/http://sokum.tistory.com/25)
#     을 참조하시기 바랍니다.


### 박유진(parkeugene7676@gmail.com) 김요한(letmegeton@gmail.com)

class Stemming

  def m(w)
    w.scan(/[aeiou][^aeiou]/).size
  end

  def positive?(w)
    m(w).to_i > 0
  end

  def one_and_o?(w)
    (m(w).to_i == 1) & o?(w)
  end

  def v?(w)
    !w.match(/[aeiou]/).nil?
  end

  def o?(w)
    !w.match(/[^aeiou][aeiou][^aeiouxyz]$/).nil?
  end

  def a(w)
    h = {
        /(sses)$/=>["ss",nil],
        /(ies)$/=>["i",nil],
        /(ss)$/=>["ss",nil],
        /(s)$/=>["",nil]
    }
    h.each do |k,v|
      if k =~ w then
        return $`+v[0]
      end
    end

  end

  def b(w)
    h = {
        /(eed)$/=>["ee",:positive?],
        /(ed)$/=>["",:v?],
        /(ing)$/=>["",:v?]
    }
    h.each do |k,v|
      if k =~ w then
        r = $`+v[0]
        if v[1].to_s!="v?"
          return send(v[1],r) ? r : w
        else
          return send(v[1],r) ? b1(r) : w
        end

      end
    end
  end

  def b1(w)
    h = {
        /(at)$/=>["ate",nil],
        /(bl)$/=>["ble",nil],
        /(iz)$/=>["ize",nil],
        /(bb)$/=>["b",nil],
        /(dd)$/=>["d",nil],
        /(ff)$/=>["f",nil],
        /(mm)$/=>["m",nil],
        /(nn)$/=>["n",nil],
        /(gg)$/=>["g",nil],
        /(pp)$/=>["p",nil],
        /(rr)$/=>["r",nil],
        /(tt)$/=>["t",nil],
        /(ww)$/=>["w",nil],
        /(xx)$/=>["x",nil],
        /()$/=>["e",:one_and_o?]
    }
    h.each do |k,v|
      if k =~ w then
        r = $`+v[0]
        if v[1].nil?
          return r
        else
          return send(v[1],$`) ? r : $`
        end

      end
    end
  end
end