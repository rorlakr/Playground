# 기름값 할인 계산기

## Problem

* 0부터 20갤론 까지 : 갤론 당 90센트
* 20초과부터 40갤론 까지 : 갤론 당 80센트
* 나머지 : 갤론 당 75센트

예를 들어 35갤론을 구입한다면, 가격은 30달러가 된다.

## Interface

```ruby
separators = [0, 20, 40, Float::INFINITY]
prices = [0.9, 0.8, 0.75]
oil_discounter = OilDiscount.new(separators, prices)

oil_discounter.price(35) # => 30
```

## Why?

현장(?)에서 해매서 집에 와서 다시 풀어보았습니다.

먼저 해맸던 점은 오래만에 RSpec을 사용해서 초기 세팅을 제대로 하지 못 했던 점이고, 두 번째는 문제 풀이법 자체였습니다.

첫번째는 Gemfile과 Guard를 통해서 자동으로 테스트되는 간단한 환경과 (루비의 정석적인) 디렉터리 구조를 구성해서 해결했습니다.

두번째 문제는, 주어진 값에 대해서 interval을 거치면서 값을 변환시키려고 했던 점에서 출발합니다. 이러한 방식으로 로직을 짜는 건 어렵지 않습니다만, 기본적으로 if문의 연속이 되어버리므로 별로 깔끔하다고 느끼지 못 했고, 이는 추상화되어있지도 않은 방법이라는 게 만족스럽지 못 했습니다. 결국 이렇게 풀었지만, 이 해답의 단점은 구간의 값이 달라지거나, 나아가 구간의 개수가 달라지면 문제 풀이 전체를 다시 짜야한다는 점입니다.

여기서는 이러한 추상화를 목표로 구간(Interval)을 먼저 정의하고, 이 Interval의 경계값과 각 구간의 값을 통해서 Oil 가격을 계산할 수 있는 OilDiscount 클래스를 만들었습니다. 이 클래스를 생성할 때 주어진 경계값들을 통해서 자동으로 구간들이 생성되며, 이 구간들 별로 값을 계산해서 더하도록 되어있습니다. 이를 통해 구간의 가격이나, 구간의 개수에 무관하게 separators와 prices만 적절하게 지정해주면 유연하게 문제를 풀 수 있습니다.

## Structure

```
$ tree
 .
 ├── Gemfile
 ├── Gemfile.lock
 ├── Guardfile
 ├── lib
 │   └── oil_discount.rb
 ├── README.md
 ├── spec
 │   ├── oil_discount_spec.rb
 │   └── spec_helper.rb
 └── tmp

3 directories, 7 files
```

## Rspec

```
$ bundle exec rspec

Interval
  Interval은 min, max를 가진다
  Interval은 구간에 포함되는 범위를 계산할 수 있다
  Interval은 무한 구간에 대하서 intersection을 계산할 수 있다.

OilDiscount
  OilDiscount은 가격을 계산할 수 있다

Finished in 0.00118 seconds (files took 0.06483 seconds to load)
4 examples, 0 failures
```
