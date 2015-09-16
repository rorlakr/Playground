require "minitest/autorun"
require "minitest/benchmark"
require "./life"

class TestLife < Minitest::Test
	def setup
		@game = Conway::Life.new([[1, 0, 1], [0, 0, 0], [1, 0, 1]])
	end

	def test_initializer
	end

	def test_xxxx
		assert_equal 0, @game.xxxx(3)
	end

	def test_surround_cells
		assert_equal [1, 0, 1, 0, 0, 1, 0, 1], @game.surround_cells(1,1)
		assert_equal [1, 0, 1, 1, 1, 0, 0, 0], @game.surround_cells(0,1)
		assert_equal [0, 0, 0, 1, 1, 1, 0, 1], @game.surround_cells(2,1)
		assert_equal [1, 1, 0, 1, 0, 0, 0, 0], @game.surround_cells(0,0)
		assert_equal [0, 0, 0, 0, 1, 0, 1, 1], @game.surround_cells(2,2)
	end

	def test_next_generation_xxx
	end
end