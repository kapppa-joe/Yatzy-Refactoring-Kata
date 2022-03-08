require_relative 'yatzy'
require 'test/unit'

class YatzyTest < Test::Unit::TestCase
  def test_chance_scores_sum_of_all_dice
    assert 15 == Yatzy.new(2,3,4,5,1).chance
    assert 16 == Yatzy.new(3,3,4,5,1).chance
  end

  def test_yatzy_scores_50_when_all_dice_are_the_same
    assert 50 == Yatzy.new(4,4,4,4,4).yatzy
    assert 50 == Yatzy.new(6,6,6,6,6).yatzy
  end

  def test_yatzy_scores_zero_when_not_all_dice_are_the_same
    assert 0 == Yatzy.new(6,6,6,6,3).yatzy
  end

  def test_ones
    assert 1 == Yatzy.new(1,2,3,4,5).ones
    assert 2 == Yatzy.new(1,2,1,4,5).ones
    assert 0 == Yatzy.new(6,2,2,4,5).ones
    assert 4 == Yatzy.new(1,2,1,1,1).ones
  end

  def test_twos
    assert 4 == Yatzy.new(1,2,3,2,6).twos
    assert 10 == Yatzy.new(2,2,2,2,2).twos
  end

  def test_threes
    assert 6 == Yatzy.threes(1,2,3,2,3)
    assert 12 == Yatzy.threes(2,3,3,3,3)
  end

  def test_fours_test
    assert 12 == Yatzy.new(4,4,4,5,5).fours
    assert 8 == Yatzy.new(4,4,5,5,5).fours
    assert 4 == Yatzy.new(4,5,5,5,5).fours
  end

  def test_fives()
    assert 10 == Yatzy.new(4,4,4,5,5).fives()
    assert 15 == Yatzy.new(4,4,5,5,5).fives()
    assert 20 == Yatzy.new(4,5,5,5,5).fives()
  end

  def test_sixes_test
    assert 0 == Yatzy.new(4,4,4,5,5).sixes()
    assert 6 == Yatzy.new(4,4,6,5,5).sixes()
    assert 18 == Yatzy.new(6,5,6,6,5).sixes()
  end

  def test_one_pair
    assert 6 == Yatzy.score_pair(3,4,3,5,6)
    assert 10 == Yatzy.score_pair(5,3,3,3,5)
    assert 12 == Yatzy.score_pair(5,3,6,6,5)
  end

  def test_two_Pair
    assert_equal 16, Yatzy.two_pair(3,3,5,4,5)
    assert_equal 16, Yatzy.two_pair(3,3,5,5,5)
  end

  def test_three_of_a_kind()
    assert 9 == Yatzy.three_of_a_kind(3,3,3,4,5)
    assert 15 == Yatzy.three_of_a_kind(5,3,5,4,5)
    assert 9 == Yatzy.three_of_a_kind(3,3,3,3,5)
  end

  def test_four_of_a_knd
    assert 12 == Yatzy.four_of_a_kind(3,3,3,3,5)
    assert 20 == Yatzy.four_of_a_kind(5,5,5,4,5)
    assert 9 == Yatzy.three_of_a_kind(3,3,3,3,3)
    assert 12 == Yatzy.four_of_a_kind(3,3,3,3,3)
  end

  def test_smallStraight()
    assert 15 == Yatzy.smallStraight(1,2,3,4,5)
    assert 15 == Yatzy.smallStraight(2,3,4,5,1)
    assert 0 == Yatzy.smallStraight(1,2,2,4,5)
  end

  def test_largeStraight
    assert 20 == Yatzy.largeStraight(6,2,3,4,5)
    assert 20 == Yatzy.largeStraight(2,3,4,5,6)
    assert 0 == Yatzy.largeStraight(1,2,2,4,5)
  end

  def test_fullHouse()
    assert 18 == Yatzy.fullHouse(6,2,2,2,6)
    assert 0 == Yatzy.fullHouse(2,3,4,5,6)
  end
end
