require_relative 'user'
require 'minitest/autorun'

class UserTest < MiniTest::Test
  attr_reader :user

  def setup
    @user = User.new
  end

  def test_constants
    levels = User::LEVELS

    assert_kind_of Array, levels
  end

  def test_initial_rank
    assert_equal -8, user.rank
  end

  def test_initial_progress
    assert_equal 0, user.progress
  end

  def test_ranking_system
    user.inc_progress -7
    user.inc_progress -5

    assert_equal -7, user.rank
  end

  def test_experience_1
    user.inc_progress -7

    assert_equal 10, user.progress
  end

  def test_experience_2
    user.inc_progress -7

    assert_equal 10, user.progress

    user.inc_progress -5

    assert_equal 0, user.progress
  end

  def test_progress_1
    # 캐릭터 레벨 -8, 몬스터 레벨 -7 이면 경험치 10점
    user.inc_progress -7

    assert_equal 10, user.progress
  end

  def test_progress_2
    # 캐릭터 레벨 -8, 몬스터 레벨 -6 이면 경험치 40점(10 X 2 X 2)
    user.inc_progress -6

    assert_equal 40, user.progress
  end

  def test_progress_3
    # 캐릭터 레벨 -8, 몬스터 레벨 -5 이면 경험치 90점(10 X 3 X 3)
    user.inc_progress -5

    assert_equal 90, user.progress
  end

  def test_progress_4
    # 캐릭터 레벨 -8, 몬스터 레벨 -4 이면 경험치 160점(10 X 4 X 4),
    # 이 경우 -7로 레벨업하고 남은 경험치는 60점을 버리지 않는다.
    user.inc_progress -4

    assert_equal 60, user.progress
    assert_equal -7, user.rank
  end

  def test_progress_5
    user = User.new(starting_level: -1)

    assert_equal -1, user.rank
    # 캐릭터 레벨 -1, 몬스터 레벨 1 이면 경험치 10점(제로 레벨이 없으므로)
    user.inc_progress 1

    assert_equal 10, user.progress
  end

  def test_progress_6
    user.inc_progress -3

    assert_equal -6, user.rank
    assert_equal 50, user.progress
  end

  def test_progress_6
    # 한꺼번에 100 이상의 경험치를 습득하게 되는 경우
    user = User.new(starting_level: 7)

    200.times do
      user.inc_progress 8
    end

    assert_equal 8, user.rank
    assert_equal 0, user.progress
  end
end
