module PokerHands
  module Entities
    class FourOfAKind
      include Comparable
      attr_reader :quads, :other_card, :strength

      def initialize(quads:, other_card:)
        @quads = quads.map(&:rank).uniq
        @other_card = other_card.map(&:rank)
        @strength = 8
      end

      def <=>(other_hand)
        if (@quads <=> other_hand.quads) != 0
          return @quads <=> other_hand.quads
        elsif (@other_card <=> other_hand.other_card) != 0
          return @other_card <=> other_hand.other_card
        else
          return 'tie'
        end
      end
    end
  end
end
