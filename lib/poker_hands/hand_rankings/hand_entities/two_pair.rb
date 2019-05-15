module PokerHands
  module Entities
    class TwoPair
      include Comparable
      attr_reader :pairs, :other_cards, :strength

      def initialize(pairs:, other_cards:)
        @pairs = pairs.map(&:rank)
        @other_cards = other_cards.map(&:rank)
        @strength = 3
      end
    end
  end
end
