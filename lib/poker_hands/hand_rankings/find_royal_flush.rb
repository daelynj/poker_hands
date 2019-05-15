require_relative 'hand_entities/royal_flush'

module PokerHands
  class FindRoyalFlush
    def call(hand)
      royal_flush_ranks = ['10', '11', '12', '13', '14']
      
      if hand.any? { |card| card.suit != hand.first.suit}
        return nil
      end

      ranks_in_hand = hand.map(&:rank)

      if !(royal_flush_ranks - ranks_in_hand).empty?
        return nil
      end

      Entities::RoyalFlush.new(hand: hand)
    end
  end
end
