require_relative 'pair'
require_relative 'three_of_a_kind'

module PokerHands
  class FullHouse
    def check(hand)
      return false if !ThreeOfAKind.new.check(hand)

      ranks_in_hand = hand.map(&:rank)

      ranks_in_hand.uniq.count { |rank| ranks_in_hand.count(rank) == 2 } == 1
    end
  end
end
