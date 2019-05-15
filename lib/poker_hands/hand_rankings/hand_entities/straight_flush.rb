module PokerHands
  module Entities
    class StraightFlush
      include Comparable
      attr_reader :cards, :strength

      def initialize(cards:)
        @cards
        @strength = 9
      end
    end
  end
end
