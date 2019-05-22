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
        other_hand_quads = other_hand.quads.map(&:rank).uniq

        quads <=> other_hand_quads
      end
    end
  end
end
