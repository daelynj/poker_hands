require_relative 'hand_rankings/royal_flush'
require_relative 'hand_rankings/straight_flush'
require_relative 'hand_rankings/four_of_a_kind'
require_relative 'hand_rankings/full_house'
require_relative 'hand_rankings/flush'
require_relative 'hand_rankings/straight'
require_relative 'hand_rankings/three_of_a_kind'
require_relative 'hand_rankings/two_pair'
require_relative 'hand_rankings/pair'
require_relative 'hand_rankings/high_card'

class Value
  def royal_flush?(hand)
    RoyalFlush.new.check(hand)
  end

  def straight_flush?(hand)
    StraightFlush.new.check(hand)
  end

  def four_of_a_kind?(hand)
    FourOfAKind.new.check(hand)
  end

  def full_house?(hand)
    FullHouse.new.check(hand)
  end

  def flush?(hand)
    Flush.new.check(hand)
  end

  def straight?(hand)
    Straight.new.check(hand)
  end

  def three_of_a_kind?(hand)
    ThreeOfAKind.new.check(hand)
  end

  def two_pair?(hand)
    TwoPair.new.check(hand)
  end

  def pair?(hand)
    Pair.new.check(hand)
  end

  def high_card?(hand)
    HighCard.new.check(hand)
  end
end
