module PokerHands
  module Entities
    class RoyalFlush
      include Comparable
      attr_reader :cards, :strength, :type

      def initialize(cards:)
        @type = 'royal flush'
        @cards = cards.map(&:rank)
        @strength = 10
      end

      def <=>(other_hand)
        if (@cards <=> other_hand.cards) != 0
          return @cards <=> other_hand.cards
        else
          return 'tie'
        end
      end
    end
  end
end
