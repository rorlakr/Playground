require "minitest/autorun"
require "minitest/benchmark"
require "./user.rb"

class TestUser < Minitest::Test
  def setup
    @user = User.new
  end

  def test_my_rank
    assert_equal -8, @user.rank
    assert_equal 0, @user.progress
    @user.inc_progress(-7)
    assert_equal 10, @user.progress # 10
    @user.inc_progress(-5) # +90
    assert_equal 0, @user.progress
    assert_equal -7, @user.rank
    @user.inc_progress(-1) # 10*6*6 = 360
    assert_equal 60, @user.progress
    assert_equal -4, @user.rank
    @user.inc_progress(-1) # 10*3*3 = 90
    assert_equal 50, @user.progress
    assert_equal -3, @user.rank
    @user.inc_progress(-1) # 10*2*2 = 40
    assert_equal 90, @user.progress
    @user.inc_progress(-1) # 10*2*2 = 40
    assert_equal 30, @user.progress
    assert_equal -2, @user.rank

    @user.inc_progress(1) # 10*2*2 = 40
    assert_equal 70, @user.progress
    assert_equal -2, @user.rank
    @user.inc_progress(8) # 10*9*9 = 810
    assert_equal 80, @user.progress
    assert_equal 7, @user.rank
    @user.inc_progress(8) # 10*1*1 = 10
    assert_equal 90, @user.progress
    @user.inc_progress(8) # 10*1*1 = 10
    assert_equal 0, @user.progress
    assert_equal 8, @user.rank
    @user.inc_progress(8) # 10*0*0 = 0
    assert_equal 0, @user.progress
    assert_equal 8, @user.rank
  end

  def test_low_level
    assert_equal -8, @user.rank
    assert_equal 0, @user.progress
    @user.inc_progress(-1) #10*7*7 = 490
    assert_equal 90, @user.progress
    assert_equal -4, @user.rank
    @user.inc_progress(-4) #10*7*7 = 490
    assert_equal 93, @user.progress
    assert_equal -4, @user.rank
    @user.inc_progress(-5)
    assert_equal 94, @user.progress
    assert_equal -4, @user.rank
    @user.inc_progress(-7)
    assert_equal 94, @user.progress
    assert_equal -4, @user.rank
  end
end
