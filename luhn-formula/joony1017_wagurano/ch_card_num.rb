# LUHN 공식 [ LUHN formula , -公式 ] 
# =========
# 신용 카드상의 번호 검증을 위해 사용하는 알고리듬. 1960년대에 개발된 개방형 공식이다.
# 원리는
# ㉠ 카드 번호의 우측 숫자부터 매 2번째 숫자마다 2를 곱하고,
# ㉡ 위 ㉠에서 2를 곱하지 않은 숫자들과 ㉠에서 나온 숫자들을 합한다(㉠에서 나온 수가 2자리 수이면 2개의 숫자를 합한다).
# ㉢ 위 ㉡에서 나온 수와 그 다음으로 큰 10단위 수와의 차이를 구한다(㉡에서 나온 수가 34이면 다음으로 큰 10단위 수 40과의 차이, 6을 구한다).
# ㉢ 에서 나온 숫자가 카드의 점검 숫자(카드 번호 마지막 숫자)와 일치해야 한다.
# 내일 뵙겠습니다! 

    class CreditCard
      def initialize num
        @number = num
      end

      def valid?
        digits = ''
       
        @number.split('').reverse.each_with_index do |d,i|
          # i+=1 
          
          digits += d if i%2 == 0
          if i.odd?
           dig = d.to_i*2
           if dig >9
              digits+=(dig - 9).to_s      
           else
              digits += dig.to_s
           end

          end
          puts digits
        end

        # puts digits.split('').inject(0){|sum,d| sum+d.to_i}

        digits.split('').inject(0){|sum,d| sum+d.to_i}%10 == 0
      end
    end

      card = CreditCard.new("4408041234567893") # ("4408041234567893","79927398713") 

      puts card.valid?
    
