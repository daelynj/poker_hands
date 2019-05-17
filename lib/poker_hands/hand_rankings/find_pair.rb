require 'poker_hands/hand_rankings/hand_entities/pair'

module PokerHands
  class FindPair
    def call(hand)
      ranks_in_hand = hand.map(&:rank)

      if ranks_in_hand.uniq.count { |rank| ranks_in_hand.count(rank) == 2 } == 0
        return nil
      end
      
      pair_rank = ranks_in_hand.select do |rank|
        ranks_in_hand.count(rank) == 2
      end
      pair_rank = pair_rank[0]

      pair = hand.select { |card| card.rank == pair_rank }
      other_cards = hand.select { |card| card.rank != pair_rank }

      Entities::Pair.new(cards: hand, pair: pair, other_cards: other_cards)
    end
  end
end
