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
        other_cards = @other_cards.map(&:rank).sort.reverse

        other_hand_set = other_hand.set.map(&:rank)
        other_hand_cards = other_hand.other_cards.map(&:rank).sort.reverse

        if (set <=> other_hand_set) != 0
          return set <=> other_hand_set
        elsif (other_cards <=> other_hand_cards) != 0
          return other_cards <=> other_hand_cards
        else
          return 'tie'
        end
      end
    end
  end
end
