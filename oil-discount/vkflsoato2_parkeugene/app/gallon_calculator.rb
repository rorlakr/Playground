# ======================
#     기름값 계산기
# 처음 20 갤론 : 갤론 당 90센트
# 다음 40 갤론 : 갤론 당 80센트
# 나머지 : 갤론 당 75센트
# 예를 들어 35갤론을 구입한다면, 가격은 30달러가 된다.
# 윤재준(vkflsoato2@naver.com), 박유진(parkeugne7676@gmail.com)
# ======================

class GallonCalculator
  attr_accessor :gallon

  def initialize(gallon)
    @gallon = gallon
    @price = 0
  end

  def cal
    if @gallon > 40
      @price = (@gallon-40) * 0.75 + 20 * 0.8 + 20 * 0.9
    elsif @gallon > 20
      @price = (@gallon-20) * 0.8 + 20 * 0.9
    else
      @price = (@gallon-0) * 0.9
    end
 end

end