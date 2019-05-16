require_relative 'hand_entities/two_pair'

module PokerHands
  class FindTwoPair
    def call(hand)
      ranks_in_hand = hand.map(&:rank)
      if ranks_in_hand.uniq.count { |rank| ranks_in_hand.count(rank) > 1 } < 2
        return nil
      end

      pairs_ranks = ranks_in_hand.select { |rank| ranks_in_hand.count(rank) == 2 }.uniq
      pairs = hand.select { |card| card.rank == pairs_ranks[0] || card.rank == pairs_ranks[1] }
      other_card = hand.select { |card| card.rank != pairs_ranks[0] && card.rank != pairs_ranks[1] }
      
      Entities::TwoPair.new(pairs: pairs, other_card: other_card)
    end
  end
end
