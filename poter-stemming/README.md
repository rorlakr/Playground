# 포터 스테밍 알고리즘(Poter Stemming Algorithm)
=========

포터 스테밍 알고리즘은 검색 엔진에서 사용되며, 단어의 접미사를 제거하거나 다른 단어로 대치하는 역할을 합니다. 가령 예를 들자면

* cats → cat
* caresses → caress
* conflated → conflate
* troubling → trouble
* relational → relate

이를 통해서 검색엔진의 색인어 수를 절반 이하로 감소시킬 수 있다고 합니다.
이번 코딩도장에서는 포터 스테밍 알고리즘의 1단계(1a, 1b, 1b1)를 구현해보도록 하겠습니다. 알고리즘에 대한 자세한 설명과 1단계의 목록은 [이 곳](https://web.archive.org/web/20121104182440/http://sokum.tistory.com/25)을 참조하시기 바랍니다.

### TDD with Rspec Guide
 * [박유진님 버전](https://github.com/parkeugene/playground)
 * [김대권님 버전](https://github.com/nacyot/my_awesome_ruby_project)

=========
## 후기

Rspec의 적용, 문제난이도 높음에 따라 시간이 부족.

### 
 * 김대권
	* 재밌었다. 준비가 잘되었다. 파이썬고수와 함께했
	* 문제가 어려웠다. 시간이 충분히 있다면 좋겠다.
	* 굉장히 쉬운문제도 오랜시간 풀 수 있는게 코딩도장인 것 같다.
 * 서준덕
 	* 루비에 대해 알게 된 것 같다.
 * 최효성
 	* 대권님의 Rspec강연 덕에 TDD를 할 수 있었다.
 	* 문제를 이해하기 어려웠다.
 * 김성준
 	* 시간이 부족했다.
 * 박유진
 	* 새로운 분들 많이 뵙게되어 좋았다.
 	* 시간이 부족했다. 다음번에는 대권님이 오늘 발표한 내용을 토대로 플레이트 코드를 미리 만들어 오려고 한다.
 * 정창훈
 	* 문제 이해하는 시간이 오래걸려 프로그래밍 할 시간이 없었다.
 	* TDD를 실습하기에는 좋은 예제였던거 같다.
