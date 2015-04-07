### 연산자 오버로딩
class Fixnum
  def modular_with value
    self % value == 0
  end
end

### 테스트 대상
class FizzBuzz
  # 메모리를 사용하는 방법
  def get(n)
    (1..n).map { |i|
      string = '``'
      string << 'Fizz' if i.modular_with 3
      string << 'Buzz' if i.modular_with 5
      string == '' ? i : string
    }
  end
  # 메모리를 사용하지 않는 방법
  def optimized_get(n)
    (1..n).map { |i|
      case
        when i.modular_with(15)
          'FizzBuzz'
        when i.modular_with(3)
          'Fizz'
        when i.modular_with(5)
          'Buzz'
        else
          i
      end
    }
  end
end



