# FizzBuzz
==========

# 해밍

유전자염기서열 DNA 이중 나선에서 해밍 거리를 계산하는 프로그램입니다.

돌연변이는 특정 DNA에서 핵산을 복제하거나 생성하는 과정에서 비롯됩니다.  

핵산은 세포 기능에 매우 중요하기 때문에 돌연변이에 따른 변화가 세포 전체에 파급 효과가 있습니다. 

돌연변이는 부정적인 측면이 있지만 매우 드물지만 세포에 유용한 특성을 생기게 하는 경우도 있습니다. 

사실, 진화에 따른 거대한 변화는 여러 세대를 거쳐서 점진 적이며 유용한 돌연변이들이 쌓이고 쌓여서 얻어 집니다.

자주 볼 수 있는 핵산 돌연변이 유형으로 점 변이가 있으며, 이 돌연변이는 단일 염기를 대체합니다.

조상은 같지만 다른 유전체에서 가져온 동질의 DNA 나선 두개 사이에 다른 것 개수를 세면 점 변이에 대한 최소 거리를 측정하고 DNA 나선 두개 사이에  진화 거리를 측정할 수 있습니다. 

여기까지 해밍 거리를 설명하였습니다.

DNA 염기 서열을 비교하여 핵산이 다른 서열(문자열로 표시)과 다른 개수를 셉니다.  

<pre>
  GAGCCTACTAACGGGAT 
  CATCGTAATGACGGCCT 
  ^ ^ ^  ^ ^  ^^
</pre>

해밍 거리는 7입니다.

해밍 거리는 길이가 같은 염기 서열에만 계산합니다.아래 링크로 가서 루비를 설치하고 참고자료를 보세요.


http://help.exercism.io/getting-started-with-ruby.html

테스트를 하기 위해 미니테스트 젬을 설치하세요. 
gem install minitest

테스트 코드 실행하려면

````ruby -Ilib:test hamming_test.rb 

## 출처 
The Calculating Point Mutations problem at Rosalind [view source](http://rosalind.info/problems/hamm/) 

Playground/hamming/ 디렉토리 아래에 두 분의 아이디를 디렉토리 이름으로 새로 만드신 후 소스파일을 올려주세요.
예) Playground/hamming/aaron_dhh/ 

* 박유진님의 테스트 코드 [TDD with Rspec Guide](https://github.com/parkeugene/playground)
* 마로치노님의 모범 사례 [Amicable](https://github.com/rorlakr/Playground/tree/master/amicable/marocchino)
* 강사룡님의 루비 스타일 설명 [루비 스타일(1) – C로부터의 탈출](https://thinkinginruby.wordpress.com/2015/04/07/exodus-from-c/)

=========
## 후기

### 000, 000
   * 000 한다.
   * 000 하였다.

