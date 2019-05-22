module PokerHands
  module Entities
    class FullHouse
      include Comparable
      attr_reader :cards, :set, :pair, :strength, :type

      def initialize(cards:, set:, pair:)
        @type = 'full house'
        @cards = cards
        @set = set
        @pair = pair
        @strength = 7
      end
      
      def <=>(other_hand)
        set = @set.map(&:rank)
        other_hand_set = other_hand.set.map(&:rank)

        set <=> other_hand_set
      end
    end
  end
end
