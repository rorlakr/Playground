로마 숫자 변환
============

로마 숫자를 변환하는 헬퍼 클래스를 만듭니다. 자연수를 로마 숫자로 바꾸거나 반대로 로마 숫자를 자연수로 바꿉니다.

````
    1990 = MCMXC 1000 (M) + 900(CM) + 90 (XC)
    2008 = MMVIII 2000 (MM) + 8(VIII)
    1666 = MDCLXVI
````

````
    class RomanNumerals
      def self.to_roman number
        # ....
      end

      def self.from_roman number
        # ....
      end
    end
    RomanNumerals.to_roman(1000) # = 'M'
    RomanNumerals.from_roman('M') # = 1000
````

````
    I = 1
    V = 5
    X = 10
    L = 50
    C = 100
    D = 500
    M = 1000
    II = 2
    VIII = 8
    XXXI = 31
    IV = 4
    CM = 900
    15 = XV
    15 != XVX
`