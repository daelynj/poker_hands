require_relative 'hand_entities/three_of_a_kind'

module PokerHands
  class FindThreeOfAKind
    def call(hand)
      ranks_in_hand = hand.map(&:rank)

      if !ranks_in_hand.uniq.any? { |rank| ranks_in_hand.count(rank) >= 3 }
        return nil
      end

      set_rank = ranks_in_hand.select { |rank| ranks_in_hand.count(rank) == 3 }.uniq
      set_rank = set_rank[0]
      set = hand.select { |card| card.rank == set_rank }
      other_cards = hand.select { |card| card.rank != set_rank }
      
      Entities::ThreeOfAKind.new(set: set, other_cards: other_cards)
    end
  end
end
