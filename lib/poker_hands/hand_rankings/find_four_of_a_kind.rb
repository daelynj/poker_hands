require_relative 'hand_entities/four_of_a_kind'

module PokerHands
  class FindFourOfAKind
    def call(hand)

      ranks_in_hand = hand.map(&:rank)

      if !ranks_in_hand.uniq.any? { |rank| ranks_in_hand.count(rank) == 4 }
        return nil
      end

      quads_rank = ranks_in_hand.select { |rank| ranks_in_hand.count(rank) == 4 }
      quads_rank = quads_rank[0]

      quads = hand.select { |card| card.rank == quads_rank }
      other_card = hand.select { |card| card.rank != quads_rank }

      Entities::FourOfAKind.new(quads: quads, other_card: other_card)
    end
  end
end
