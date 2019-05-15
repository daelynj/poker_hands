require_relative 'hand_rankings/find_two_pair'
require_relative 'hand_rankings/find_pair'
require_relative 'hand_rankings/find_high_card'
require_relative 'hand_rankings/find_three_of_a_kind'
<<<<<<< HEAD
<<<<<<< HEAD
require_relative 'hand_rankings/find_straight_flush'
require_relative 'hand_rankings/find_flush'
=======
require_relative 'hand_rankings/find_straight'
>>>>>>> Implement FindStraight
=======
require_relative 'hand_rankings/find_full_house'
>>>>>>> Implement FindFullHouse

module PokerHands
  class ClassifyHand
    def call(hand)
      found_hands = 
      [
<<<<<<< HEAD
<<<<<<< HEAD
        FindStraightFlush.new.call(hand),
        FindFlush.new.call(hand),
=======
        FindStraight.new.call(hand),
>>>>>>> Implement FindStraight
=======
        FindFullHouse.new.call(hand),
>>>>>>> Implement FindFullHouse
        FindThreeOfAKind.new.call(hand),
        FindTwoPair.new.call(hand),
        FindPair.new.call(hand),
        FindHighCard.new.call(hand)
      ]

      return found_hands.find { |hand| !hand.nil? }
    end
  end
end
