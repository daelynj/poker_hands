module PokerHands
  module Entities
    class HighCard
      include Comparable
      attr_reader :cards, :strength, :type

      def initialize(cards:)
        @type = 'high card'
        @cards = cards
        @strength = 1
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
