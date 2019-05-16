module PokerHands
  module Entities
    class TwoPair
      include Comparable
      attr_reader :pairs, :other_card, :strength, :type

      def initialize(pairs:, other_card:)
        @type = 'two pair'
        @pairs = pairs.map(&:rank).sort.reverse
        @other_card = other_card.map(&:rank)
        @strength = 3
      end
      
      def <=>(other_hand)
        if (@pairs <=> other_hand.pairs) != 0
          return @pairs <=> other_hand.pairs
        elsif (@other_card <=> other_hand.other_card) != 0
          return @other_card <=> other_hand.other_card
        else
          return 'tie'
        end
      end
    end
  end
end
