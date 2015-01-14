# Ruby Playground

## Porter Stemming Algorithm

: https://web.archive.org/web/20121104182440/http://sokum.tistory.com/25

![그림](http://cfs5.tistory.com/upload_control/download.blog?fhandle=YmxvZzEzODkxQGZzNS50aXN0b3J5LmNvbTovYXR0YWNoLzAvMDEwMDAwMDAwMDEwLmdpZg%3D%3D)
![그림](http://cfs5.tistory.com/upload_control/download.blog?fhandle=YmxvZzEzODkxQGZzNS50aXN0b3J5LmNvbTovYXR0YWNoLzAvMDEwMDAwMDAwMDA4LmdpZg%3D%3D)
![그림](http://cfs5.tistory.com/upload_control/download.blog?fhandle=YmxvZzEzODkxQGZzNS50aXN0b3J5LmNvbTovYXR0YWNoLzAvMDEwMDAwMDAwMDExLmdpZg%3D%3D)
![그림](http://cfs6.tistory.com/upload_control/download.blog?fhandle=YmxvZzEzODkxQGZzNi50aXN0b3J5LmNvbTovYXR0YWNoLzAvMDEwMDAwMDAwMDA2LmdpZg%3D%3D)
=======
# Set up Ruby Project

* https://speakerdeck.com/nacyot/set-up-ruby-project

2014년 12월 23일 RORLab Digging Deeper 세션 발표 자료.

## 구조

```
$ tree
.
├── Gemfile
├── Gemfile.lock
├── Guardfile
├── README.md
├── lib
│   ├── my_awesome_ruby_project
│   │   └── awesome_cat.rb
│   └── my_awesome_ruby_project.rb
├── spec
├── my_awesome_ruby_project
│   └── awesome_cat_spec.rb
└── spec_helper.rb

4 directories, 8 files
```

## Using

### Set up

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]

$ bundle -v
Bundler version 1.7.3
# 번들이 없으면 gem install bundle로 설치

$ git clone https://github.com/nacyot/my_awesome_ruby_project.git
$ cd my_awesome_ruby_project
$ bundle install
...
```

### Test

Rspec을 사용한 테스트 환경 구축.

```
$ bundle exec rspec
MyAwesomeRubyProject::AwesomeCat
  My first awesome test
  My second awesome test

Finished in 0.00228 seconds (files took 0.16071 seconds to load)
2 examples, 0 failures
```

### Guard(watch)

프로젝트 내의 파일이 변경되면, Guardfile에 정의된 규칙에 따라 테스트 실행.

```
$ bundle exec guard
11:06:48 - INFO - Guard is using Tmux to send notifications.
11:06:48 - INFO - Guard is using TerminalTitle to send notifications.
11:06:49 - INFO - Guard::RSpec is running
11:06:49 - INFO - Guard is now watching at '/Users/toto/Dropbox/programmings/github/nacyot/my_awesome_ruby_project'
[1] guard(main)>
```