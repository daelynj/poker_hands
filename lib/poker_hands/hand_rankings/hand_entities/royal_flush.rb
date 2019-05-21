module PokerHands
  module Entities
    class RoyalFlush
      include Comparable
      attr_reader :cards, :strength, :type

      def initialize(cards:)
        @type = 'royal flush'
        @cards = cards
        @strength = 10
      end

      def <=>(other_hand)
        cards = @cards.map(&:rank)
        other_hand_cards = cards.map(&:rank)

        if (cards <=> other_hand_cards) != 0
          return cards <=> other_hand_cards
        else
          return 'tie'
        end
      end
    end
  end
end
