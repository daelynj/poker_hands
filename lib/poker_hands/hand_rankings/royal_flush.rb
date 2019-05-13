module PokerHands
  class RoyalFlush
    def check(hand)
      royal_flush_ranks = ['10', '11', '12', '13', '14']
      
      return false if hand.any? { |card| card.suit != hand.first.suit}

      ranks_in_hand = hand.map(&:rank)

      (royal_flush_ranks - ranks_in_hand).empty?
    end
  end
end
