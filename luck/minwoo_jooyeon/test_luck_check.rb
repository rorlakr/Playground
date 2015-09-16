require "minitest/autorun"
require "minitest/benchmark"
require "./luck_check"

class TestLuckCheck < Minitest::Test
	def test_raise_error_if_non_number
		assert_raises RuntimeError do
			luck_check('a')
			luck_check('1a')
			luck_check('a1')
			luck_check('1a1')
		end
		luck_check('1')
	end

	def test_true_if_two_digits
		assert_equal true, luck_check('11')
		assert_equal true, luck_check('22')
		assert_equal true, luck_check('33')
		assert_equal true, luck_check('44')
		assert_equal true, luck_check('99')
		assert_equal false, luck_check('12')
		assert_equal false, luck_check('21')
	end

	def xtest_true_even
		assert_equal true, even?('1234')
		assert_equal false, even?('17935')
	end

	def test_split_test
		assert_equal '12', '1234'[0..1]
		assert_equal '12', '1234'[0...2]
		assert_equal '34', '1234'[2..-1]
		assert_equal '3', '1234'[2...-1]
		assert_equal '3', '1234'[2..-2]
	end

	def test_split_when_length_is_even
		assert_equal ['12', '34'], split('1234')
		assert_equal ['123', '456'], split('123456')
	end

	def test_split_when_length_is_odd
		assert_equal ['12', '23'], split('123')
		assert_equal ['1234', '4567'], split('1234567')
	end

	def test_test
		assert_equal [1, 1], '11'.each_char.map(&:to_i)
		assert_equal 1, '1'.to_i
		assert_equal [1], ['1'].map { |v| v.to_i }
		assert_equal [1], ['1'].map(&:to_i)
		assert_equal 6, [1, 2, 3].reduce(:+)
	end

	def test_true_when_even
		assert_equal true, luck_check('1111')
		assert_equal true, luck_check('2222')
		assert_equal true, luck_check('1221')
		assert_equal true, luck_check('1212')
		assert_equal false, luck_check('1234')
	end

	def test_true_when_odd
		assert_equal true, luck_check('111')
		assert_equal true, luck_check('222')
		assert_equal true, luck_check('121')
		assert_equal true, luck_check('17935')
	end

	def test_xx
		assert_equal true, luck_check('003111')
		assert_equal true, luck_check('813372')
		assert_equal true, luck_check('17935')
		assert_equal true, luck_check('56328116')
	end
end