require 'poker_hands/hand_rankings/find_flush'
require 'poker_hands/hand_rankings/hand_entities/straight_flush'

module PokerHands
  class FindStraightFlush
    def call(hand)
      if FindFlush.new.call(hand).nil? || FindStraight.new.call(hand).nil?
        return nil
      end

      Entities::StraightFlush.new(cards: hand)
    end
  end
end
