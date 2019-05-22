require 'poker_hands/hand_rankings/find_flush'
require 'poker_hands/hand_rankings/hand_entities/straight_flush'

module PokerHands
  class FindStraightFlush
    def call(hand)
      if FindFlush.new.call(hand).nil? || FindStraight.new.call(hand).nil?
        return nil
      end

      sorted_hand = hand.sort_by { |card| card.rank }
      if sorted_hand[-1].rank == 14 && sorted_hand[-2].rank == 5
        high_card = sorted_hand[-2]
      else
        high_card = sorted_hand.last
      end
      
      Entities::StraightFlush.new(cards: hand, high_card: high_card)
    end
  end
end
