Rspec을 이용하여 Ruby로 알고리즘 풀기
====================================
Ruby의 테스트 툴인 Rspec을 이용하여 알고리즘 문제를 풀고 개선합니다.  
  
설치
===
먼저 bundler가 설치돼 있어야 합니다.  
gem install bundler  

git clone https://github.com/parkeugene/playground.git  
cd playground  
bundle install  

사용방법
=======
spec/ 디렉토리에 스펙작성.  
app/ 디렉토리에 코드작성.  

테스트
=====
테스트 러너인 guard를 실행  
playground_$ guard  

예제
====
app/self_nubmer.rb  
spec/self_nubmer_spec.rb  

