module PokerHands
  module Entities
    class RoyalFlush
      include Comparable
      attr_reader :cards, :strength

      def initialize(cards:)
        @cards = cards
        @strength = 10
      end
    end
  end
end
