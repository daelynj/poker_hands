module PokerHands
  module Entities
    class StraightFlush
      include Comparable
      attr_reader :cards, :strength, :type

      def initialize(cards:)
        @type = 'straight flush'
        @cards = cards
        @strength = 9
      end

      def <=>(other_hand)
        straight = @cards.map(&:rank).reverse
        other_hand_straight = straight.map(&:rank).reverse
        
        if (straight <=> other_hand_straight) != 0
          return straight <=> other_hand_straight
        else
          return 'tie'
        end
      end
    end
  end
end
