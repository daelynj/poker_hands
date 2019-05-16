module PokerHands
  module Entities
    class Straight
      include Comparable
      attr_reader :straight, :strength

      def initialize(straight:)
        @straight = straight.map(&:rank).reverse
        @strength = 5
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
