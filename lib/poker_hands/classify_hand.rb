require_relative 'hand_rankings/find_two_pair'
require_relative 'hand_rankings/find_pair'
require_relative 'hand_rankings/find_high_card'
require_relative 'hand_rankings/find_three_of_a_kind'
require_relative 'hand_rankings/find_straight_flush'
require_relative 'hand_rankings/find_flush'
require_relative 'hand_rankings/find_straight'
require_relative 'hand_rankings/find_full_house'
require_relative 'hand_rankings/find_four_of_a_kind'

module PokerHands
  class ClassifyHand
    def call(hand)
      found_hands = 
      [
        FindStraightFlush.new.call(hand),
        FindFlush.new.call(hand),
        FindStraight.new.call(hand),
        FindFullHouse.new.call(hand),
        FindFourOfAKind.new.call(hand),
        FindThreeOfAKind.new.call(hand),
        FindTwoPair.new.call(hand),
        FindPair.new.call(hand),
        FindHighCard.new.call(hand)
      ]

      return found_hands.find { |hand| !hand.nil? }
    end
  end
end
