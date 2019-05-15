require_relative 'hand_rankings/find_two_pair'
require_relative 'hand_rankings/find_pair'
require_relative 'hand_rankings/find_high_card'

module PokerHands
  class ClassifyHand
    def call(hand)
      found_hands = 
      [
        FindTwoPair.new.call(hand),
        FindPair.new.call(hand),
        FindHighCard.new.call(hand)
      ]

      return found_hands.find { |hand| !hand.nil? }
    end
  end
end
