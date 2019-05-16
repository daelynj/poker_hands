module PokerHands
  module Entities
    class Pair
      include Comparable
      attr_reader :pair, :other_cards, :strength

      def initialize(pair:, other_cards:)
        @pair = pair[0].rank
        @other_cards = other_cards.map(&:rank).sort.reverse
        @strength = 2
      end

      def <=>(other_hand)
        if (@pair <=> other_hand.pair) != 0
          return @pair <=> other_hand.pair
        elsif (@other_cards <=> other_hand.other_cards) != 0
          return @other_cards <=> other_hand.other_cards
        else
          return 'tie'
        end
      end
    end
  end
end
