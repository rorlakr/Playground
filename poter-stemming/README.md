# 포터 스테밍 알고리즘(Poter Stemming Algorithm)
=========

포터 스테밍 알고리즘은 검색 엔진에서 사용되며, 단어의 접미사를 제거하거나 다른 단어로 대치하는 역할을 합니다. 가령 예를 들자면

* cats → cat
* caresses → caress
* conflated → conflate
* troubling → trouble
* relational → relate

이를 통해서 검색엔진의 색인어 수를 절반 이하로 감소시킬 수 있다고 합니다.
이번 코딩도장에서는 포터 스테밍 알고리즘의 1단계(1a, 1b, 1b1)를 구현해보도록 하겠습니다. 알고리즘에 대한 자세한 설명과 1단계의 목록은 [이 곳](http://sokum.tistory.com/25)을 참조하시기 바랍니다.

### TDD with Rspec Guide
[박유진님 버전](https://github.com/parkeugene/playground)
[김대권님 버전](https://github.com/nacyot/my_awesome_ruby_project)

=========
## 후기

### 발표자
* 