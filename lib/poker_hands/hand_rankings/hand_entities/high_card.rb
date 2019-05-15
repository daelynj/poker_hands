module PokerHands
  module Entities
    class HighCard
      include Comparable
      attr_reader :cards, :strength

      def initialize(cards:)
        @cards = cards
        @strength = 1
      end
    end
  end
end
