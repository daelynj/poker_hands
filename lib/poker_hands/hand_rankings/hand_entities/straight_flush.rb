module PokerHands
  module Entities
    class StraightFlush
      include Comparable
      attr_reader :cards, :strength

      def initialize(cards:)
        @cards = cards.map(&:rank).reverse
        @strength = 9
      end

      def <=>(other_hand)
        if (@straight <=> other_hand.straight) != 0
          return @straight <=> other_hand.straight
        else
          return 'tie'
        end
      end
    end
  end
end
