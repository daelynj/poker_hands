require 'poker_hands/hand_rankings/hand_entities/royal_flush'
require 'poker_hands/hand_rankings/find_flush'

module PokerHands
  class FindRoyalFlush
    def call(hand)
      royal_flush_ranks = ['10', '11', '12', '13', '14']
      
      if FindFlush.new.call(hand).nil?
        return nil
      end

      ranks_in_hand = hand.map(&:rank)

      if !(royal_flush_ranks - ranks_in_hand).empty?
        return nil
      end

      Entities::RoyalFlush.new(cards: hand)
    end
  end
end
