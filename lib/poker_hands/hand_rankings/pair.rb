module PokerHands
  class Pair
    def check(hand)
      ranks_in_hand = hand.map(&:rank)

      ranks_in_hand.uniq.count { |rank| ranks_in_hand.count(rank) > 1 } > 0
    end
  end
end
