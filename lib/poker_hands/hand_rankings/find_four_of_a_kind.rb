require_relative 'hand_entities/four_of_a_kind'

module PokerHands
  class FindFourOfAKind
    def call(hand)

      ranks_in_hand = hand.map(&:rank)

      if !ranks_in_hand.uniq.any? { |rank| ranks_in_hand.count(rank) == 4}
        return nil
      end

      foak_rank = ranks_in_hand.select { |rank| ranks_in_hand.count(rank) == 4 }.uniq
      foak = hand.select { |card| card.rank == foak_rank[0] }
      other_card = hand.select { |card| card.rank != foak_rank[0] }

      Entities::FourOfAKind.new(foak: foak, other_card: other_card)
    end
  end
end
