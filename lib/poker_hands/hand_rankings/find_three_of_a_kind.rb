require_relative 'hand_entities/three_of_a_kind'

module PokerHands
  class FindThreeOfAKind
    def call(hand)
      ranks_in_hand = hand.map(&:rank)

      if !ranks_in_hand.uniq.any? { |rank| ranks_in_hand.count(rank) >= 3 }
        return nil
      end

      toak_rank = ranks_in_hand.uniq { |rank| ranks_in_hand.count(rank) > 3 }
      toak = hand.select { |card| card.rank == toak_rank[0] }
      other_cards = hand.select { |card| card.rank != toak_rank[0] }
      other_cards.sort_by! { |card| card.rank.to_i }
      
      Entities::ThreeOfAKind.new(toak: toak, other_cards: other_cards)
    end
  end
end
