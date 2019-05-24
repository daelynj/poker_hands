module PokerHands
  module Entities
    class FourOfAKind
      include Comparable
      attr_reader :cards, :quads, :other_card, :strength, :type

      def initialize(cards:, quads:, other_card:)
        @type = 'four of a kind'
        @cards = cards
        @quads = quads
        @other_card = other_card
        @strength = 8
      end

      def <=>(other_hand)
        quads = @quads.map(&:rank).uniq
        other_card = @other_card.map(&:rank)

        other_hand_quads = other_hand.quads.map(&:rank).uniq
        other_hand_card = other_hand.other_card.map(&:rank)

        if (quads <=> other_hand_quads) != 0
          return quads <=> other_hand_quads
        elsif (other_card <=> other_hand_card) != 0
          return other_card <=> other_hand_card
        else
          return 'tie'
        end
      end
    end
  end
end
