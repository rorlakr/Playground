require 'minitest/autorun'
begin
  require_relative 'hamming'
rescue LoadError => e
  puts "\n\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class HammingTest < Minitest::Test
  def test_no_difference_between_identical_strands
    assert_equal 0, Hamming.compute('A', 'A')
  end

  def test_complete_hamming_distance_of_single_nucleotide_strand
    assert_equal 1, Hamming.compute('A', 'G')
  end

  # def test_complete_hamming_distance_of_small_strand
  #   skip
  #   assert_equal 2, Hamming.compute('AG', 'CT')
  # end

  # def test_small_hamming_distance
  #   skip
  #   assert_equal 1, Hamming.compute('AT', 'CT')
  # end

  # def test_small_hamming_distance_in_longer_strand
  #   skip
  #   assert_equal 1, Hamming.compute('GGACG', 'GGTCG')
  # end

  # def test_nonunique_characters_within_first_strand
  #   skip
  #   assert_equal 1, Hamming.compute('AGA', 'AGG')
  # end

  # def test_nonunique_characters_within_second_strand
  #   skip
  #   assert_equal 1, Hamming.compute('AGG', 'AGA')
  # end

  # def test_large_hamming_distance
  #   skip
  #   assert_equal 4, Hamming.compute('GATACA', 'GCATAA')
  # end

  # def test_hamming_distance_in_very_long_strand
  #   skip
  #   assert_equal 9, Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')
  # end
end
