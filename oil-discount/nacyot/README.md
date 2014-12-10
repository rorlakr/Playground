# 기름값 할인 계산기

## Problem

* 0부터 20갤론 까지 : 갤론 당 90센트
* 20초과부터 40갤론 까지 : 갤론 당 80센트
* 나머지 : 갤론 당 75센트

예를 들어 35갤론을 구입한다면, 가격은 30달러가 된다.

## Interface

```
separators = [0, 20, 40, Float::INFINITY]
prices = [0.9, 0.8, 0.75]
oil_discounter = OilDiscount.new(separators, prices)

oil_discounter.price(35) # => 30
```

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
