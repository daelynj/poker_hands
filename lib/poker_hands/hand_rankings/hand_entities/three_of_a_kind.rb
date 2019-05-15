module PokerHands
  module Entities
    class ThreeOfAKind
      include Comparable
      attr_reader :toak, :other_cards, :strength

      def initialize(toak:, other_cards:)
        @toak = toak.map(&:rank)
        @other_cards = other_cards.map(&:rank).reverse
        @strength = 4
      end
    end
  end
end
