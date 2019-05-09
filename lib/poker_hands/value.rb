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
    true
  end

  def straight_flush?(hand)
    true
  end

  def four_of_a_kind?(hand)
    true
  end

  def full_house?(hand)
    true
  end

  def flush?(hand)
    true
  end

  def straight?(hand)
    true
  end

  def three_of_a_kind?(hand)
    true
  end

  def two_pair?(hand)
    true
  end

  def pair?(hand)
    true
  end

  def high_card?(hand)
    true
  end
end
