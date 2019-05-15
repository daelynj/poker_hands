require_relative 'hand_entities/pair'

module PokerHands
  class FindPair
    def call(hand)
      ranks_in_hand = hand.map(&:rank)

      if ranks_in_hand.uniq.count { |rank| ranks_in_hand.count(rank) > 1 } == 0
        return nil
      end
      pair_rank = ranks_in_hand.uniq { |rank| ranks_in_hand.count(rank) > 2 }
      pair = hand.select { |card| card.rank == pair_rank[0] }
      other_cards = hand.select { |card| card.rank != pair_rank[0] }
      other_cards.sort_by! { |card| card.rank.to_i }

      Entities::Pair.new(pair: pair, other_cards: other_cards)
    end
  end
end
