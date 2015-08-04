돈 놓고 돈 먹기(Shell Game)
===

"돈 놓고 돈 먹기"(쉘 게임)에서 컵 아래에 숨겨둔 공을 찾는 문제첫번째 컵 아래에 공을 숨겨두고, 위치를 서로 바꿀 컵을 쌍을 지어 나열합니다. 나열한데로 컵을 서로 바꾼 결과 공이 있는 위치를 보여주세요.컵 위치는 0부터 시작하고 공은 0번 컵에 숨겨두었습니다.

> **예시** 
````ruby
   swaps = [[0,1], [1,2], [1, 0]] 
   find_the_ball(0, swaps) == 2 
   # 컵 2개 
   # 순서 섞기 swaps = [[0, 1]] 
   find_the_ball(0, swaps) == 1 
   find_the_ball(1, swaps) == 0 
   # 컵 3개 
   # 순서 섞기 swaps = [[0, 1], [1, 2], [2, 0], [0, 1], [1, 2], [2, 1], [2, 0], [0, 2]] 
   find_the_ball(0, swaps) == 1 
   # 순서 섞기 swaps = [[0, 2], [1, 0]] 
   find_the_ball(0, swaps) == 2 
   find_the_ball(1, swaps) == 0 
   # 컵 10개 
   # 순서 섞기 swaps = [[0, 9], [9, 3], [3, 7], [7, 8], [8, 2], [4, 5]] 
   find_the_ball(0, swaps) == 2 
   find_the_ball(1, swaps) == 1 
   find_the_ball(2, swaps) == 8 
   find_the_ball(3, swaps) == 9 
   find_the_ball(4, swaps) == 5 
   find_the_ball(5, swaps) == 4 
   find_the_ball(6, swaps) == 6
````

Playground/shell/ 디렉토리 아래에 두 분의 아이디를 디렉토리 이름으로 새로 만드신 후 소스파일을 올려주세요.
예) Playground/shell/why_matz/ 

* 박유진님의 테스트 코드 [TDD with Rspec Guide](https://github.com/parkeugene/playground)
* 마로치노님의 모범 사례 [Amicable](https://github.com/rorlakr/Playground/tree/master/amicable/marocchino)
* 강사룡님의 루비 스타일 설명 [루비 스타일(1) – C로부터의 탈출](https://thinkinginruby.wordpress.com/2015/04/07/exodus-from-c/)

=========
## 후기

### 
   * 000 한다.
   * 000 하였다.

