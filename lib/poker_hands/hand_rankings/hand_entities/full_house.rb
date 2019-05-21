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
        pair = @pair.map(&:rank)

        other_hand_set = other_hand.set.map(&:rank)
        other_hand_pair = other_hand.pair.map(&:rank)

        if (set <=> other_hand_set) != 0
          return set <=> other_hand_set
        elsif (pair <=> other_hand_pair) != 0
          return pair <=> other_hand_pair
        else
          return 'tie'
        end
      end
    end
  end
end
