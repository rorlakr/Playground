# 어떤 자연수 n이 있을 때, d(n)을 n의 각 자릿수 숫자들과 n 자신을 더한 숫자라고 정의하자.
#     예를 들어 d(91) = 9 + 1 + 91 = 101
# 이 때, n을 d(n)의 제네레이터(generator)라고 한다. 위의 예에서 91은 101의 제네레이터이다.
# 어떤 숫자들은 하나 이상의 제네레이터를 가지고 있는데, 101의 제네레이터는 91뿐 아니라 100도 있다.
# 그런데 반대로, 제네레이터가 없는 숫자들도 있으며, 이런 숫자를 인도의 수학자 Kaprekar가
# 셀프 넘버(self-number)라 이름 붙였다.
# 예를 들어 1,3,5,7,9,20,31은 셀프 넘버들이다.
# 1이상이고 5000보다 작은 모든 셀프 넘버들의 합을 구하라.

class SelfNumber

  def self.d(n)
      n + sum_digit(n)
  end

  def self.sum_digit(n)
    return n if n < 10
    n%10 + sum_digit(n/10) # tail recursion
  end

end

ary = *(1..4999)
1.upto(4999) do |n|
  ary.delete(SelfNumber.d(n))
end

puts ary.inject(:+)

