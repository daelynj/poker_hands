module PokerHands
  module Entities
    class TwoPair
      include Comparable
      attr_reader :cards, :pairs, :other_card, :strength, :type

      def initialize(cards:, pairs:, other_card:)
        @type = 'two pair'
        @cards = cards
        @pairs = pairs
        @other_card = other_card
        @strength = 3
      end
      
      def <=>(other_hand)
        pairs = @pairs.map(&:rank).sort.reverse
        other_card = @other_card.map(&:rank)

        other_hand_pairs = other_hand.pairs.map(&:rank).sort.reverse
        other_hand_card = other_hand.other_card.map(&:rank)

        if (pairs <=> other_hand_pairs) != 0
          return pairs <=> other_hand_pairs
        elsif (other_card <=> other_hand_card) != 0
          return other_card <=> other_hand_card
        else
          return 'tie'
        end
      end
    end
  end
end
