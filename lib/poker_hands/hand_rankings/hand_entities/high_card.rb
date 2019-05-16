module PokerHands
  module Entities
    class HighCard
      include Comparable
      attr_reader :cards, :strength, :type

      def initialize(cards:)
        @type = 'high card'
        @cards = cards.map(&:rank).sort.reverse
        @strength = 1
      end

      def <=>(other_hand)
        if (@cards <=> other_hand.cards) != 0
          return @cards <=> other_hand.cards
        elsif (@cards <=> other_hand.cards) == 0
          return 'tie'
        end
      end
    end
  end
end
