module PokerHands
  module Entities
    class Pair
      include Comparable
      attr_reader :pair, :other_cards

      def initialize(pair:, other_cards:)
        @pair = pair.map(&:rank)
        @other_cards = other_cards.map(&:rank).reverse
      end

      def <=>(other_hand)
        pair <=> other_hand.pair
        if (pair <=> other_hand.pair) == 0
          return other_cards <=> other_hand.other_cards
        end
      end
    end
  end
end
