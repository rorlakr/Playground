Bowling score 계산하기
====================================
Bowling score를 프레임 별로 계산합니다.

설명
===
미리 정해놓은 input으로 점수 계산하는 것이 아니라 프레임 별로 점수 계산이 가능하도록 구현하였습니다.
input 데이터는 1차 배열로 받습니다.
볼링 점수 계산에 필요한 상태들을 멤버 변수로 선언해 놓고 input에 따라서 상태를 변경합니다.
첫번째 시도가 STRIKE 프레임을 [10,0] 으로 완성시킵니다.
첫번째 시도값이 10이 아니라면 두번째 input까지 받고 프레임을 완성시킵니다.(ex : [3,5])

프레임별 총 점수 계산공식은
total_score = total_score + past_past_frame_score + past_frame_score + current_frame_score 입니다.

total_score 는 총 점수이며
past_past_frame_score 는 아직 정산되지 않은 2번째 전 프레임 점수(즉 스트라이크,스트라이크, 점수) 
past_frame_score 는 아직 정산되지 않은 1번째 전 프레임 점수(전 프레임이 스트라이크 OR 스페어일때)
current_frame_score 는 현재 정산 가능한 현 프레임 점수(스트라이크나 스페어가 아닐경우. 스트라이크나 스페어의 경우 다음 프레임, 혹은 다다음 프레임에 정산됩니다)

재밌게도 이 계산 알고리즘은 10프레임에서도 정상 동작합니다.
왜 그런지는 rspec 결과를 돌려보며 확인하는것도 좋을 것 같습니다.

설치
===
gem install bundler  

git clone https://github.com/parkeugene/playground.git  
cd playground  
bundle install  

테스트
=====
테스트 러너인 guard를 실행  
playground_$ guard  

혹은
bowling_$ rspec



