문자열 회전수
===========

문자열 2개를 비교하여 첫번째 문자열을 오른쪽으로 한 글자씩 돌려서 몇번만에 두번째 문자열이 되는지 알려줍니다.
예를 들어 fatigue 를 5번 돌리면 tiguefa 가 됩니다. 
다만, 첫번쨰 문자열을 여러번 돌려도 두번쨰 문자열이 될 수 없으면 -1 입니다.

예시
````
    def diff first, second
      # ...
      -1
    end
    diff "coffee", "eecoff" # => 2
    diff "eecoff", "coffee" # => 4
    diff "moose", "Moose" # => -1
    diff "isn't", "'tisn" # => 2
    diff "Esham", "Esham" # => 0
    diff "dog", "god" # => -1
````
