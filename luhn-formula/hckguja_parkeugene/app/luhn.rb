## 정구진 , 박유진
## hckguja@gmail.com, parkeugene7676@gmail.com
## github : tndjqdkel@gmail.com, parkeugene7676@gmail.com

# LUHN 공식 [ LUHN formula , -公式 ]
# =========
#     신용 카드상의 번호 검증을 위해 사용하는 알고리듬. 1960년대에 개발된 개방형 공식이다.
#     원리는
#     ㉠ 카드 번호의 우측 숫자부터 매 2번째 숫자마다 2를 곱하고,
#     ㉡ 위 ㉠에서 2를 곱하지 않은 숫자들과 ㉠에서 나온 숫자들을 합한다(㉠에서 나온 수가 2자리 수이면 2개의 숫자를 합한다).
#     ㉢ 위 ㉡에서 나온 수와 그 다음으로 큰 10단위 수와의 차이를 구한다(㉡에서 나온 수가 34이면 다음으로 큰 10단위 수 40과의 차이, 6을 구한다).
#     ㉢ 에서 나온 숫자가 카드의 점검 숫자(카드 번호 마지막 숫자)와 일치해야 한다.
#     http://en.wikipedia.org/wiki/Luhn_algorithm

class Luhn

  def g(n)
    digit_length = Math.log10(n).to_i # 숫자 n의 자리수
    sum = 0

    (0..digit_length).each do |i|
      digit = n / 10**i % 10 # 각 자리 수의 값

      if i.even?
        sum += digit*2/10 + digit*2%10 # 2를 곱하고 2자리 수이면 2개의 숫자를 합한다.
      else
        sum += digit
      end

    end

    sum*9%10 # 큰 10단위 수와의 차 - 숫자의 합에 9를 곱하고 1의 자리를 구해도 같은 값이다.
  end

  def v?(n)
    g(n/10) == n%10
  end
end