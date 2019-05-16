require_relative 'find_pair'
require_relative 'find_three_of_a_kind'
require_relative 'hand_entities/full_house'

module PokerHands
  class FindFullHouse
    def call(hand)
      if FindThreeOfAKind.new.call(hand).nil? || FindPair.new.call(hand).nil?
        return nil
      end

      ranks_in_hand = hand.map(&:rank)
      
      set_rank = ranks_in_hand.select { |rank| ranks_in_hand.count(rank) == 3 }
      set_rank = set_rank[0]
      
      set = hand.select { |card| card.rank == set_rank }
      pair = hand.select { |card| card.rank != set_rank }
      
      Entities::FullHouse.new(set: set, pair: pair)
    end
  end
end
