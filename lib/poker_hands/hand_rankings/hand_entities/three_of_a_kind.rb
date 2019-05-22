module PokerHands
  module Entities
    class ThreeOfAKind
      include Comparable
      attr_reader :cards, :set, :other_cards, :strength, :type

      def initialize(cards:, set:, other_cards:)
        @type = 'three of a kind'
        @cards = cards
        @set = set
        @other_cards = other_cards
        @strength = 4
      end

      def <=>(other_hand)
        set = @set.map(&:rank)
        other_hand_set = other_hand.set.map(&:rank)

        set <=> other_hand_set
      end
    end
  end
end
