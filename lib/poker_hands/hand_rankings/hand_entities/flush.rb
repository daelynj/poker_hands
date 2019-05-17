module PokerHands
  module Entities
    class Flush
      include Comparable
      attr_reader :cards, :strength, :type

      def initialize(cards:)
        @type = 'flush'
        @cards = cards
        @strength = 6
      end

      def <=>(other_hand)
        cards = @cards.map(&:rank).sort.reverse
        other_hand_cards = other_hand.cards.map(&:rank).sort.reverse

        if (cards <=> other_hand_cards) != 0
          return cards <=> other_hand_cards
        else
          return 'tie'
        end
      end
    end
  end
end
