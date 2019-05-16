require_relative 'find_pair'
require_relative 'find_three_of_a_kind'
require_relative 'hand_entities/full_house'

module PokerHands
  class FindFullHouse
    def call(hand)
      if FindThreeOfAKind.new.call(hand).nil?
        return nil
      end

      ranks_in_hand = hand.map(&:rank)

      if ranks_in_hand.uniq.count { |rank| ranks_in_hand.count(rank) == 2 } == 0
        return nil
      end

      toak_rank = ranks_in_hand.select { |rank| ranks_in_hand.count(rank) == 3 }.uniq
      toak = hand.select { |card| card.rank == toak_rank[0] }
      pair = hand.select { |card| card.rank != toak_rank[0] }
      
      Entities::FullHouse.new(toak: toak, pair: pair)
    end
  end
end
