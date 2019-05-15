require_relative 'hand_rankings/find_two_pair'
require_relative 'hand_rankings/find_pair'
require_relative 'hand_rankings/find_high_card'
require_relative 'hand_rankings/find_three_of_a_kind'
<<<<<<< HEAD
require_relative 'hand_rankings/find_straight_flush'
require_relative 'hand_rankings/find_flush'
=======
require_relative 'hand_rankings/find_straight'
>>>>>>> Implement FindStraight

module PokerHands
  class ClassifyHand
    def call(hand)
      found_hands = 
      [
<<<<<<< HEAD
        FindStraightFlush.new.call(hand),
        FindFlush.new.call(hand),
=======
        FindStraight.new.call(hand),
>>>>>>> Implement FindStraight
        FindThreeOfAKind.new.call(hand),
        FindTwoPair.new.call(hand),
        FindPair.new.call(hand),
        FindHighCard.new.call(hand)
      ]

      return found_hands.find { |hand| !hand.nil? }
    end
  end
end
