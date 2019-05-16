module PokerHands
  module Entities
    class ThreeOfAKind
      include Comparable
      attr_reader :set, :other_cards, :strength

      def initialize(set:, other_cards:)
        @set = set.map(&:rank)
        @other_cards = other_cards.map(&:rank).sort.reverse
        @strength = 4
      end

      def <=>(other_hand)

        if (@set <=> other_hand.set) != 0
          return @set <=> other_hand.set
        elsif (@other_cards <=> other_hand.other_cards) != 0
          return @other_cards <=> other_hand.other_cards
        else
          return 'tie'
        end
      end
    end
  end
end
