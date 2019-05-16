module PokerHands
  module Entities
    class FullHouse
      include Comparable
      attr_reader :set, :pair, :strength

      def initialize(set:, pair:)
        @set = set.map(&:rank)
        @pair = pair.map(&:rank)
        @strength = 7
      end
      
      def <=>(other_hand)
        if (@set <=> other_hand.set) != 0
          return @set <=> other_hand.set
        elsif (@pair <=> other_hand.pair) != 0
          return @pair <=> other_hand.pair
        else
          return 'tie'
        end
      end
    end
  end
end
