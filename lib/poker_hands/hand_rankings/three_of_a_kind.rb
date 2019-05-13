module PokerHands
  class ThreeOfAKind
    def check(hand)
      hand.sort_by! { |card| card.rank.to_i }

      ranks_in_hand = hand.map(&:rank)

      ranks_in_hand.uniq.any? do |rank|
        ranks_in_hand.count(rank) >= 3
      end
    end
  end
end
