# 3n + 1
# 어떤 정수 n에서 시작해 n이 짝수면 2로 나누고, 홀수면 3을 곱한 다음 1을 더한다(3n+1). 이렇게 해서 새로 만들어진 숫자를 다시 n으로 놓고 n = 1일 때까지 계속 반복해서 수열을 만들어 낸다.
# 예를들어, n = 22 이면 다음과 같은 수열이 만들어진다.
# 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1
# 아직 증명되진 않았지만 모든 정수 n에 대해 이 알고리즘을 적용시키면 결국에는 n = 1에 이르게 되는 것으로 예측된다.
# 입력 n에 대해서 n의 cycle-length는 1을 포함하여 생성된 수의 개수이다. 위의 예에서 22의 cycle-length는 16이다. 두 수 i와 j가 주어지면 i와 j사이의 모든 수의 cycle-length 중 가장 큰 값을 구한다.

# 18
# 21

# 97
# 119

# 6171
# 262

# 77031
# 351

# 837799
# 525

# 837799
# 525

# cache linked list

arr = [] 

def cy n, arr 
  t1 = 0
  t2 = 0
  
  return 1 if n <= 1
  if n % 2 == 0 
    t1 = cy(n/2, arr)
    puts n, t1
    arr << t1
  else
    t2 = cy(3 * n + 1, arr)
    puts n, t2
    arr << t2
  end
    
end

def cy_next n
  if n == 1
    return 1
  elsif n % 2 == 0
    return n / 2
  else
    return n + n + n + 1 # 3 * n + 1
  end 
end

#puts arr if cy 22, arr

def cy_cnt a
  cnt = 1
  while a > 1
    # puts a
    a = cy_next a
    cnt += 1
  end
  # puts a
  cnt
end

# puts cy_cnt 22

i = 1
# j = 100000 # 1000000
j = 1000000
cys = []
max = 0
max_n = 0
(i..j).each do |n|
  x = cy_cnt n
  if x > max
    max = x
    max_n = n
  end
end
puts max_n, max
